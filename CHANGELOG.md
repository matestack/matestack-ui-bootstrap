# Changelog

## v3.0.0 Release - 2022-03-04

- same as v3.0.0.rc2

## v3.0.0.rc2 Release - 2022-02-23

- fixing vue warnings about unneccessary value binding on checkbox components

## v3.0.0.rc1 Release - 2022-02-15

- please read the [migration guide](docs/migrate-from-2.x-to-3.0.md)

## v2.1.0 Release - 2021-06-29

### Improvements

- Added flexible column rendering via slots #17
- Added nested form support
- Added textarea component #6

### Bugfixes

- Enable disabled for select and switch #16
- use step, min, max option for all input type, enabling float number input #15

## v2.0.1 Release - 2021-04-12

### Bugfixes

- Fixe publishing missing scss files

## v2.0.0 Release - 2021-04-12

### Changes

- various internal adjustments matching `matestack-ui-core` 2.0.0 changes
- changed to MIT license like `matestack-ui-core`


## v1.5.1 Release - 2021-03-07

### Bugfixes

- Fixed wrong dependency specs for matestack-ui-core (Ruby gem and NPM package)

## v1.5.0 Release - 2021-03-07

### Changes

- bumped from Bootstrap `v5.0.0-alpha-3` to `v5.0.0-beta-2`
- removed Chart.js as deeply integrated component/dependency, providing integration docs instead (limit scope of this gem)
- removed Flatpickr as deeply integrated component/dependency, providing integration docs instead (limit scope of this gem)
- removed Devise page templates, providing integration docs instead

### Bugfixes

- Various bugfixes due to Bootstrap breaking changes
- Various bugfixes discovered while working with this gem in a real life app

## v1.4.0 Release - 2021-02-11 (published but not announced)

- Initial release, starting with `1.4.0` in order to emphasize alignment with matestack-ui-core version
- We never announced this version in public because we knew of bugs and upcoming breaking changes due to Bootstrap version bump
