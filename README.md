# Bats example

[![CircleCI](https://circleci.com/gh/AlexSkrypnyk/bats-example.svg?style=shield)](https://circleci.com/gh/AlexSkrypnyk/bats-example)
[![Test Coverage](https://api.codeclimate.com/v1/badges/013eedfa4b4f19b771dc/test_coverage)](https://codeclimate.com/github/AlexSkrypnyk/bats-example/test_coverage)

Example to demonstrate how to use [bats] and [kcov] for bash script test
coverage.

## Usage

```bash
docker run --rm -v "$(pwd)":/workspace -w /workspace drevops/ci-builder:23.9.0 \
  kcov \
    --clean \
    --include-pattern=.sh \
    --bash-parse-files-in-dir=. \
    --exclude-path=node_modules,vendor,coverage \
    coverage \
    bats \
    tests
```

where:

- `--rm`: Remove container after execution.
- `-v "$(pwd)":/workspace`: Mounts the current working directory to `/workspace`
  in the container.
- `-w /workspace`: Sets the working directory inside the container.
- `drevops/ci-builder:canary`: The Docker image being used.
- `kcov`: The command to run coverage analysis.
- `--clean`: Clean any previous coverage data.
- `--include-pattern=.sh`: Only include `.sh` files in the coverage report. Used
  for testing the filtering system.
- `--bash-parse-files-in-dir=.`: Important! Include ALL files in the coverage
  report, even the ones that did not get executed by tests. This is to see the
  real coverage of all scripts.
- `--exclude-path=node_modules,vendor,coverage`: Exclude these paths from
  coverage. Since we are including the whole current directory, we need to
  exclude some directories that may contain scripts matching
  the `--include-pattern`.
- `coverage`: Directory where coverage reports will be saved.
- `bats`: Bash Automated Testing System, the test runner.
- `tests`: The directory containing the tests to run.

## Truth table

| Index | File            | Subdir | Ext ignored | Tested | In report | Has coverage |
|-------|-----------------|--------|-------------|--------|-----------|--------------|
| 1     | `1.sh`          | N      | N           | N      | Y         | N            |
| 2     | `2.sh`          | N      | N           | Y      | Y         | Y            |
| 3     | `3.bash`        | N      | Y           | N      | N         | N            |
| 4     | `4.bash`        | N      | Y           | Y      | N         | N            |
| 5     | `subdir/5.sh`   | Y      | N           | N      | Y         | N            |
| 6     | `subdir/6.sh`   | Y      | N           | Y      | Y         | Y            |
| 7     | `subdir/7.bash` | Y      | Y           | N      | N         | N            |
| 8     | `subdir/8.bash` | Y      | Y           | Y      | N         | N            |

Expected coverage report result:

| Filename                                     | Coverage percent | Covered lines | Uncovered lines | Executable lines |
|----------------------------------------------|------------------|---------------|-----------------|------------------|
| [/workspace/1.sh](1.sh.7b6efc43.html)        | 0.0%             | 0             | 1               | 1                |
| [/workspace/2.sh](2.sh.69db53ad.html)        | 100.0%           | 1             | 0               | 1                |
| [/workspace/subdir/5.sh](5.sh.9a2fa4aa.html) | 0.0%             | 0             | 1               | 1                |
| [/workspace/subdir/6.sh](6.sh.889a0b44.html) | 100.0%           | 1             | 0               | 1                |


## Example of Code Climate coverage

https://codeclimate.com/github/AlexSkrypnyk/bats-example/hello.sh/source

https://codeclimate.com/github/AlexSkrypnyk/bats-example/scripts/goodbye.sh/source
