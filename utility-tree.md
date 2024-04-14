# Utility Tree

## Glossary

- CI:
  - GitHub Actions runner with Linux, Windows, or macOS.
  - Offline operation.

- Normalize tests:
  - A command to normalize approximately 300 valid `PHI` tests.

## Functional Correctness

### Preserving semantics of an input program

| ID          | 9633                                                                   |
| ----------- | ---------------------------------------------------------------------- |
| Source      | A pipeline script                                                      |
| Stimulus    | Normalize tests                                                        |
| Environment | CI                                                                     |
| Artifact    | `normalizer` executable                                                |
| Response    | All `PHI` tests are normalized.                                        |
| Measure     | All tests pass after being translated to EO and run by the EO compiler |

## Functional Appropriateness

### Reducing metrics

| ID          | 9707                                                                                                                                       |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Source      | A pipeline script                                                                                                                          |
| Stimulus    | Normalize tests                                                                                                                            |
| Environment | CI                                                                                                                                         |
| Artifact    | `normalizer` executable                                                                                                                    |
| Response    | All `PHI` tests are normalized.                                                                                                            |
| Measure     | For 90% of tests, the number of applications, dispatches, dataless formations reduces by 20%, and the number of formations reduces by 10%. |

## Interoperability

### Integration into a pipeline

| ID          | 1747                                                                       |
| ----------- | -------------------------------------------------------------------------- |
| Source      | A pipeline script                                                          |
| Stimulus    | Normalize tests                                                            |
| Environment | CI                                                                         |
| Artifact    | `normalizer` executable                                                    |
| Response    | All `PHI` tests are normalized.                                            |
| Measure     | 100% of normalized tests are accepted by the next program in the pipeline. |

## Performance

### Handling multi-file apps

| ID               | 7972                                                                        |
| ---------------- | --------------------------------------------------------------------------- |
| Source           | A pipeline script                                                           |
| Stimulus         | A command to normalize programs in a Spring application using custom rules. |
| Environment      | CI                                                                          |
| Artifact         | `normalizer` executable                                                     |
| Response         | `PHI` files are normalized.                                                 |
| Response measure | Normalization takes no more than 1 hour.                                    |

## Modifiability

### Adding new atoms

| ID               | 9460                                                                                           |
| ---------------- | ---------------------------------------------------------------------------------------------- |
| Source           | A user                                                                                         |
| Stimulus         | A user adds a new atom by following the instructions.                                          |
| Environment      | A user machine/CI                                                                              |
| Artifact         | `normalizer` Haskell code                                                                      |
| Response         | `normalizer` is compiled correctly or the compiler reports errors.                             |
| Response measure | No more than 10 lines of the initial normalizer code should be modified to connect a new atom. |

## Testability

### Transformation rules are testable

| ID               | 5791                                                                           |
| ---------------- | ------------------------------------------------------------------------------ |
| Source           | A developer                                                                    |
| Stimulus         | A developer adds a rule.                                                       |
| Environment      | A developer's machine                                                          |
| Artifact         | A rules file                                                                   |
| Response         | A developer adds 5 different unit tests to the rules file and makes them pass. |
| Response measure | 100% of unit tests for rules pass in CI.                                       |

### Functions are testable

| ID               | 7987                                          |
| ---------------- | --------------------------------------------- |
| Source           | A developer                                   |
| Stimulus         | A developer modifies the Haskell code.        |
| Environment      | A developer's machine                         |
| Artifact         | Haskell code                                  |
| Response         | Doctests are created or updated.              |
| Response measure | Coverage reported by HPC is no less than 60%. |

### Normalizer is testable

| ID               | 6102                                                                                    |
| ---------------- | --------------------------------------------------------------------------------------- |
| Source           | Pipeline script                                                                         |
| Stimulus         | Pipeline script runs `normalizer` on one of steps.                                      |
| Environment      | CI                                                                                      |
| Artifact         | `normalizer` executable                                                                 |
| Response         | `normalizer` transforms supplied `PHI` programs.                                        |
| Response measure | For 100% of tests, results of running normalized and non-normalized tests are the same. |

## Installability

### Supporting several platforms

| ID               | 6580                                                                                     |
| ---------------- | ---------------------------------------------------------------------------------------- |
| Source           | Pipeline script                                                                          |
| Stimulus         | Pipeline script runs `stack install` to build `normalizer` from sources and install it.  |
| Environment      | CI                                                                                       |
| Artifact         | `normalizer` Haskell code                                                                |
| Response         | `normalizer` installation finishes.                                                      |
| Response measure | `normalizer` installation finishes successfully and `normalizer` is available on `PATH`. |

## Confidentiality

### Offline operation

| ID               | 1755                                                                                                                                                       |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Source           | Developer                                                                                                                                                  |
| Stimulus         | Developer modifies code.                                                                                                                                   |
| Environment      | Developer's machine                                                                                                                                        |
| Artifact         | `normalizer` Haskell code                                                                                                                                  |
| Response         | Developer does not add networking functionality.                                                                                                           |
| Response measure | <p><ul><li>No packages in the <code>.cabal</code> file provide networking capabilities.</li><li>No external commands are called via subprocesses.</li></p> |
