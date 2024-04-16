This repository contains all of nil's libraries for vcpkg distribution.

## To include in your repository

- setup `vcpkg`
- make sure to add this repository to vcpkg-config.json

```json
{
    "$schema": "https://raw.githubusercontent.com/microsoft/vcpkg-tool/main/docs/vcpkg-configuration.schema.json",
    "default-registry": null,
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/Microsoft/vcpkg",
            "baseline": "da21e45c9ae689f63aa27f3a4ee0e64fe6b16494",
            "packages": ["*"]
        }, 
        {
            "kind": "git",
            "repository": "https://github.com/njaldea/nil-vcpkg-ports",
            "baseline": "25ca98d3bb1d27131cb1932ef1af426569255ec5",
            "packages": ["nil*"]
        }
    ]
}
```

- baseline is the commit hash of the repository to use
- in vcpkg.json, add your dependencies

```json
// using nil with features
{
    "dependencies": [
        {
            "name": "nil",
            "features": ["gate"]
        }
    ]
}

// using each library individually
{
    "dependencies": [ "nil-gate" ]
}
```

- in your cmake files
```cmake
# if you are depending on `nil` with `gate` feature
find_package(nil COMPONENTS gate CONFIG REQUIRED)
target_link_libraries(main PRIVATE nil::gate)

# if you are directly depending on `nil-gate`
find_package(nil-gate CONFIG REQUIRED)
target_link_libraries(main PRIVATE nil::gate)
```

## cmake template

cmake folder contains a template and a package script.

## To publish a new version

- edit portfile.cmake for the library to publish
    - `REF` == current commit hash
    - `SHA512` == acquire by locally installing the package
- commit changes
- run `git rev-parse` for the library port and for `nil` port
    - `git rev-parse HEAD:ports/nil`
    - `git rev-parse HEAD:ports/nil-${library_to_publish}`
- update git-tree in versions
    - `versions/n-/nil.json`
    - `versions/n-/nil-${library_to_publish}.json`
- commit changes
- push to remote