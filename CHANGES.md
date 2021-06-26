# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Main page for documentation now explain basic concepts and functionality and
  contains examples of using the library.

## 0.1.1 - 2021-06-23
### Added
- `ppx_inline_test` is now a test dependency, instead of a full dependency.
- Support OCaml > 4.08.1.
- Documentation and internal updates.

### Changed
- Optimizations
  - Improved subsumption for Demarau-Levenshtein
  - Early cutoff based on size difference for `Make.*.get_distance`.
  - Bit fiddling optimizations: `snoc_ones`, `snoc_zeros`.

## 0.1.0 - 2021-06-20

Initial release.
