This repository contains all of nil's libraries for vcpkg distribution.

## To include in your repository

- setup `vcpkg`
- make sure to add this repository to vcpkg-configuration.json

```json
{
    "$schema": "https://raw.githubusercontent.com/microsoft/vcpkg-tool/main/docs/vcpkg-configuration.schema.json",
    "default-registry": {
        "kind": "git",
        "repository": "https://github.com/Microsoft/vcpkg",
        "baseline": "84bab45d415d22042bd0b9081aea57f362da3f35"
    },
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/njaldea/nil-vcpkg-ports",
            "baseline": "b061f302e81ffcf50ad3f200d4b70c97020be778",
            "packages": ["nil*"]
        }
    ]
}
```

- baseline is the commit hash of the repository to use
- in vcpkg.json, add your dependencies

```json
{
    "dependencies": [ "nil-gate" ]
}
```

- in your cmake files

```cmake
# if you are directly depending on `nil-gate`
find_package(nil-gate CONFIG REQUIRED)
target_link_libraries(main PRIVATE nil::gate)
```

## Versions

[Here](./VERSIONS.md) is the list of packages provided by this registry.

## Dev Notes

- to update port versions: [scripts/update](./scripts/update)
- to update version list: [scripts/versions](./scripts/versions)
- to test local manifest install: [scripts/install](./scripts/install)
    - to build .deb packages (`-d`)
    - to upload python wheel (`-p`)
- to clone repository: [scripts/git-clone](./scripts/git-clone)