This repository contains all of nil's libraries for vcpkg distribution.

## To publish a new version

- edit portfile.cmake for the library to publish
    - `REF` == current commit hash
    - `SHA512` == acquire via steps in next section
- commit changes
- run `git rev-parse HEAD:ports/nil-${library_to_publish}`
- update/add git-tree in `versions/n-/nil-${library_to_publish}.json`
- update `ports/nil` if necessary
- run `git rev-parse HEAD:ports/nil`
- update/add git-tree in `versions/n-/nil.json`
- commit changes
- push to remote