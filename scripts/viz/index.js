const $ = id => document.getElementById(id);

let data;
let byHash;
let commits;
let shown;
let selected = null;
let walked = new Set();

let currentRender;


/*
 * Per-commit data never changes, so keep one request per hash
 * for the page lifetime.
 */
const depsCache = new Map();

function depsOf(h) {
  if (!depsCache.has(h)) {
    const url = "deps/" + h + ".json";
    const req = fetch(url)
      .then(r => {
        if (!r.ok) throw new Error(`${url}: ${r.status}`);
        return r.json();
      })
      .catch(err => {
        depsCache.delete(h);
        throw err;
      });

    depsCache.set(h, req);
  }
  return depsCache.get(h);
}

function el(tag, props, ...children) {
  const e = document.createElement(tag);
  Object.assign(e, props);
  e.append(...children);
  return e;
}

function svg(tag, attrs, ...children) {
  const e = document.createElementNS("http://www.w3.org/2000/svg", tag);
  for (const k in attrs) e.setAttribute(k, attrs[k]);
  e.append(...children);
  return e;
}

function prevOf(c) { return (byHash[c.p] || c).v; }


/*
 * Walk back from c; each commit colors the ports that newer
 * commits left uncolored.
 */
async function walk(c) {
  const ports = Object.keys(c.v);

  const state = {};
  const from = {};
  const cause = {};
  const used = [];

  for (let r = c; r && Object.keys(state).length < ports.length; r = byHash[r.p]) {
    const e = await depsOf(r.h);
    const prev = prevOf(r);
    const deps = p => (e[p] || []).filter(d => d in r.v);
    const updated = p => r.v[p] !== prev[p];
    const memo = {};
    const affected = p => {
      if (!(p in memo)) { memo[p] = false; memo[p] = deps(p).some(d => updated(d) || affected(d)); }
      return memo[p];
    };
    for (const p of ports) {
      if (p in state || !(p in r.v)) continue;
      if (updated(p)) state[p] = "latest";
      else if (affected(p)) { state[p] = "stale"; cause[p] = deps(p).filter(d => updated(d) || affected(d)); }
      else continue;
      from[p] = r;
    }
    used.push(r);
  }
  return { state, from, cause, used };
}

class Render {
  constructor(commit) {
    this.commit = commit;
    currentRender = this;
  }

  check() {
    if (currentRender !== this) throw new Error("render cancelled");
  }

  async run() {
    let walkResult;
    let dependencies;

    try {
      [ walkResult, dependencies ] = await Promise.all([ walk(this.commit), depsOf(this.commit.h) ]);
      this.check();
    }
    catch (err) {
      if (currentRender === this) $("graph").textContent = "failed to load dependencies: " + err.message;

      return;
    }

    const { state, from, cause, used } = walkResult;
    const walked = new Set(used.map(r => r.h));
    for (const tr of document.querySelectorAll("tbody tr")) tr.classList.toggle("range", walked.has(tr.dataset.h));

    const c = this.commit;
    const ports = Object.keys(c.v).sort();
    const deps = p => (dependencies[p] || []).filter(d => d in c.v);
    const W = 120, H = 40, PAD = 18;
    const stateOf = p => state[p] || "ok";
    const outdated = (p, d) => state[p] === "stale" && cause[p].includes(d);

    const layout = await new ELK().layout({
      id: "root",

      layoutOptions: {
        "elk.algorithm": "layered",
        "elk.direction": "UP",
        "elk.edgeRouting": "ORTHOGONAL",
        "elk.layered.spacing.nodeNodeBetweenLayers": "20",
        "elk.spacing.nodeNode": "10",
        "elk.layered.spacing.edgeNodeBetweenLayers": "16",
        "elk.layered.spacing.edgeEdgeBetweenLayers": "12",
        "elk.layered.crossingMinimization.strategy": "LAYER_SWEEP",
        "elk.layered.nodePlacement.strategy": "BRANDES_KOEPF",
        "elk.layered.layering.strategy": "NETWORK_SIMPLEX",
        "elk.layered.cycleBreaking.strategy": "GREEDY",
        "elk.layered.considerModelOrder.strategy": "NODES_AND_EDGES",
        "elk.layered.compaction.postCompaction": true,
        "elk.layered.compaction.componentCompaction": true,
        "elk.layered.mergeEdges": false,
        "elk.padding": `[top=${PAD},left=${PAD},bottom=${PAD},right=${PAD}]`
      },
      children: ports.map((p, i) => ({
        id: p,
        width: W,
        height: H,
        layoutOptions: { "elk.layered.layering.layerChoiceConstraint": "NONE" },
        properties: { order: i }
      })),
      edges: ports.flatMap(p => deps(p).map((d, i) => ({
        id: `${p}=>${d}#${i}`,
        sources: [p],
        targets: [d]
      })))
    });

    this.check();

    const width = Math.max(W + PAD * 2, layout.width || 0);
    const height = Math.max(H + PAD * 2, layout.height || 0);
    const root = svg("svg", { viewBox: `0 0 ${width} ${height}`, width: "100%" },
      svg("defs", {}, ...["edge", "stale"].map(k =>
        svg("marker", { id: "arrow-" + k, viewBox: "0 0 10 10", refX: 9, refY: 5, markerWidth: 5, markerHeight: 5, orient: "auto" },
          svg("path", { d: "M0,0 L10,5 L0,10 z", class: k })))));

    const point = p => `${p.x},${p.y}`;
    for (const edge of layout.edges || []) {
      const parts = edge.id.split("=>");
      const p = parts[0];
      const d = parts[1]?.split("#")[0];
      if (!(p in c.v) || !(d in c.v)) continue;
      const section = edge.sections?.[0];
      if (!section) continue;
      const points = [section.startPoint, ...(section.bendPoints || []), section.endPoint];
      const k = outdated(p, d) ? "stale" : "edge";
      root.append(svg("path", {
        d: "M" + points.map(point).join(" L"),
        class: k,
        fill: "none",
        "marker-end": `url(#arrow-${k})`
      }));
    }

    const nodeById = new Map((layout.children || []).map(n => [n.id, n]));
    for (const p of ports) {
      const n = nodeById.get(p);
      if (!n) continue;
      const st = stateOf(p);
      const at = from[p] ? " in " + from[p].h.slice(0, 7) : "";
      const title = st === "latest" ? "updated" + at
        : st === "stale" ? "not updated after " + cause[p].join(", ") + at : "no change found";
      const node = svg("g", { class: "node " + st, transform: `translate(${n.x},${n.y})` },
        svg("title", {}, title),
        svg("rect", { width: W, height: H, rx: 6 }),
        svg("text", { x: W / 2, y: 17, "text-anchor": "middle" }, p),
        svg("text", { x: W / 2, y: 32,"text-anchor": "middle", class: "ver" }, c.v[p]));
      node.onmouseenter = () => {
        if (st === "ok") return;
        const row = document.querySelector(`#wrap tbody tr[data-h="${from[p].h}"]`);
        if (!row) return;
        row.classList.add("port-hover", st);
        const causes = st === "latest" ? [p] : cause[p];
        for (const td of row.querySelectorAll("td[data-p]")) td.classList.toggle("cause-hover", causes.includes(td.dataset.p));
      };
      node.onmouseleave = () => {
        for (const x of document.querySelectorAll("#wrap .port-hover, #wrap .cause-hover")) x.classList.remove("port-hover", "latest", "stale", "cause-hover");
      };
      root.append(node);
    }

    const swatch = color => el("span", { className: "swatch", style: "background:" + color });
    const span = `walked ${used.length} commit(s): ${c.h.slice(0, 7)} back to ${used[used.length - 1].h.slice(0, 7)}`;
    $("graph").className = "";
    $("graph").replaceChildren(el("div", { className: "hint" }, span), root, el("div", { className: "hint" },
      "arrow = depends on", swatch("#86efac"), "updated", swatch("#fde68a"), "a dependency was updated after it"));
  }
}

function cell(c, prev, p) {
  const now = c.v[p], before = prev[p];
  if (now === undefined && before === undefined) return el("td", { className: "v" });
  if (now === undefined) return el("td", { className: "v del", title: "removed" }, before);
  if (before === undefined) return el("td", { className: "v new", title: "new" }, now);
  if (now !== before) return el("td", { className: "v chg", title: "from " + before }, now);
  return el("td", { className: "v" }, now);
}

function renderPorts() {
  $("ports").replaceChildren(...data.ports.map(p => {
    const b = el("button", { textContent: p });
    b.setAttribute("aria-pressed", shown.has(p));
    b.onclick = () => { shown.has(p) ? shown.delete(p) : shown.add(p); render(); };
    return b;
  }));
}

function select(c) {
  if (selected !== c) walked = new Set();
  selected = c;
  render();
}

function render() {
  renderPorts();
  const ports = data.ports.filter(p => shown.has(p));
  const q = $("q").value.trim().toLowerCase();
  const only = $("only").checked;

  const head = el("tr", {}, el("th", {}, "commit"), el("th", {}, "date"));
  for (const p of ports) {
    head.append(el("th", { textContent: p }));
  }
  document.querySelector("thead").replaceChildren(head);

  const rows = [];
  for (const c of commits) {
    const prev = prevOf(c);
    if (only && !ports.some(p => c.v[p] !== prev[p])) continue;
    if (q && ![c.h, c.d, ...ports.map(p => c.v[p] || "")].some(x => x.toLowerCase().includes(q))) continue;
    const hash = data.web
      ? el("a", { href: data.web + "/commit/" + c.h, target: "_blank", rel: "noopener", onclick: e => e.stopPropagation() }, c.h.slice(0, 7))
      : c.h.slice(0, 7);
    const tr = el("tr", { className: (c === selected ? "sel " : "") + (walked.has(c.h) ? "range" : ""), onclick: () => select(c) },
      el("td", {}, el("code", {}, hash)), el("td", {}, c.d),
      ...ports.map(p => { const td = cell(c, prev, p); td.dataset.p = p; return td; }));
    tr.dataset.h = c.h;
    rows.push(tr);
  }
  document.querySelector("tbody").replaceChildren(...rows);
  $("count").textContent = rows.length + " / " + commits.length + " commits";
  renderDetail();
}

function renderDetail() {
  if (!selected) return;
  new Render(selected).run();
  const c = selected, prev = prevOf(c);
  const names = [...new Set([...Object.keys(c.v), ...Object.keys(prev)])].sort();
  const list = el("table", {}, ...names.map(p => el("tr", {}, el("td", {}, p), cell(c, prev, p))));
  const config = JSON.stringify({
    kind: "git",
    repository: data.remote,
    baseline: c.h,
    packages: Object.keys(c.v).sort(),
  }, null, 2);
  const copy = (text, btn) => navigator.clipboard.writeText(text).then(() => { btn.textContent = "copied"; });
  const hashBtn = el("button", { textContent: "copy hash", onclick: () => copy(c.h, hashBtn) });
  const cfgBtn = el("button", { textContent: "copy registry", onclick: () => copy(config, cfgBtn) });
  $("detail").replaceChildren(
    el("p", {}, el("code", {}, c.h), " ", hashBtn),
    el("p", { className: "hint" }, c.d),
    list,
    el("h4", {}, "vcpkg-configuration registry ", cfgBtn),
    el("pre", {}, config),
  );
}

async function load() {
  try {
    const response = await fetch("commits.json");
    if (!response.ok) throw new Error("commits.json: " + response.status);
    data = await response.json();
    byHash = Object.fromEntries(data.commits.map(c => [c.h, c]));
    commits = data.commits.slice(data.start).reverse();
    shown = new Set(data.ports);
    selected = commits[0] || null;
    $("q").oninput = render;
    $("only").onchange = render;
    document.addEventListener("keydown", e => {
      if (e.key === "Escape") { data.ports.forEach(p => shown.add(p)); $("only").checked = false; $("q").value = ""; render(); }
    });
    render();
  } catch (err) {
    $("graph").textContent = "failed to load commits: " + err.message;
  }
}

load();