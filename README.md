# Bats example

[![CircleCI](https://circleci.com/gh/AlexSkrypnyk/bats-example.svg?style=shield)](https://circleci.com/gh/AlexSkrypnyk/bats-example)
[![Test Coverage](https://api.codeclimate.com/v1/badges/013eedfa4b4f19b771dc/test_coverage)](https://codeclimate.com/github/AlexSkrypnyk/bats-example/test_coverage)

Example to demonstrate how to use [bats] and [kcov] for bash script test coverage.

## Usage

Using `kcov` with Bats:
```
kcov --include-path=. coverage bats tests
```
where
 - `--include-path=.` is a path to your files that should be included in coverage. Pointing to the current directory. Note that sub-directories (like `scripts`) are automatically included.
 - `coverage` is a name of the directory where coverage reports will be saved to.
 - `bats` is a binary name of the `bats-core` package which runs tests
 - `tests` is a directory with BAT's tests; it is an argument to `bats` binary.


Running in Docker:
```
docker run --rm -v "$(pwd)":/workspace -w /workspace drevops/ci-builder:canary kcov --include-path=. coverage bats tests
```

## Example of Code Climate coverage

The coverage has been intentionally reduced to highlight the paths that aren't covered by tests.

https://codeclimate.com/github/AlexSkrypnyk/bats-example/hello.sh/source

https://codeclimate.com/github/AlexSkrypnyk/bats-example/scripts/goodbye.sh/source
