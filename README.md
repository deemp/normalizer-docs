# Normalizer documentation

Additional documentation for the [normalizer](https://github.com/objectionary/normalizer) project.

## Confluence proof

It's assumed that the rewriting system used for normalization is confluent.

This [repository](https://github.com/objectionary/proof) contains a confluence proof in Lean 4.

Here ([link](https://www.overleaf.com/4611428655spqyynvnqgrt#978f7a)) are the questions about PHI and sample programs.

## Timeline

```mermaid
timeline
    title Timeline of the Normalizer project
    section Stage 1 (January - June)
        mid-December - start of February
            : Hardcode normalization rules
            : Discuss design
            : Start confluence proof for Minimal PHI
            : Release eo-phi-normalizer 0.1.0
        start of February - mid-February
            : Implement some user-defined rules
            : Add metrics collection
            : Work on a confluence proof for Minimal PHI
            : Test against the EO compiler in CI pipeline
            : Release eo-phi-normalizer 0.2.0
        mid-February - end of March
            : Support more YAML rules
            : Support report generation
            : Partially support dataization
            : Mostly prove confluence for Minimal PHI
            : Submit a paper for ITP 2024
            : Partially prove Extended PHI
            : Release eo-phi-normalizer 0.3.0
        end of March - mid-April
            : Generate reports, update docs, save artifacts for each CI run
            : Extend dataization support
            : Finish confluence proof for Minimal PHI
            : Collect EO team proposals for ineo
            : Release eo-phi-normalizer 0.3.1
        mid-April - mid-May
            : Extend dataization support
            : Test against new EO compiler versions
            : Receive and implement complete rules for Extended PHI
            : Test normalizer on a Spring application
            : Update EO team proposals
            : Work on a patent
            : Release eo-phi-normalizer 0.4.0
        mid-May - end of May
            : Implement EO team proposals
            : Extend dataization support
            : Optimize normalizer to work well on a Spring application
            : Work on a confluence proof for Extended PHI
            : Study SOAS
            : Work on a patent
        start of June
            : Release eo-phi-normalizer 0.4.0
            : Produce and submit Deliverables for Stage 1
            : Get feedback from the Customer representative
```

```mermaid
timeline
    title Timeline of the Normalizer project
    section Stage 2
        start of June - end of June
            : Work on custom rules proposals
            : Run tests without complete normalization
            : Update the rules of Extended PHI
            : Release eo-phi-normalizer 0.4.2
        end of June - end of July
            : Implement a faster normalizer engine using Free Foil
            : Implement custom rules for the Spring application
            : Finish confluence proof for Extended PHI
            : Release eo-phi-normalizer 0.5.0
        end of July - end of August
            : Extend test suite and adapt normalizer
            : Submit an academic paper on the new normalizer engine
            : Develop the idea of a confluence proof generator
            : Release eo-phi-normalizer 0.5.1
    section Stage 3
        start of September - start of December
            : Write a confluence proof generator
            : Submit a patent
```

## GitHub Issues

[link](https://github.com/objectionary/normalizer/issues).

Issues are labelled.

Issues are prioritized ([priority 1](https://github.com/objectionary/normalizer/issues?q=is%3Aopen+is%3Aissue+label%3A%22priority+1%22), ..., [priority 5](https://github.com/objectionary/normalizer/issues?q=is%3Aopen+is%3Aissue+label%3A%22priority+5%22+)) because we want to know what issues to work on first.

Issues are categorized by the scope they belong to ([(dataization)](https://github.com/objectionary/normalizer/issues?q=is%3Aissue+is%3Aopen+label%3A%28dataization%29+), [(atoms)](https://github.com/objectionary/normalizer/issues?q=is%3Aissue+is%3Aopen+label%3A%28atoms%29+), etc.) because we want to know what remains to be done in a particular part of the project.

Some issues are related to non-functional requirements ([[peformance]](https://github.com/objectionary/normalizer/issues?q=is%3Aissue+is%3Aopen+label%3A%5Bperformance%5D+), etc.) because it's convenient to track non-functional requirements as issues.

## Architecture

### Notes

See [Notes](general-notes.md)

### Utility tree

See [Utility Tree](https://github.com/objectionary/normalizer/issues/321).

### Structurizr

The diagrams are described in the [Structurizr DSL](https://docs.structurizr.com/dsl) in [this file](./architecture/workspace.dsl).

The rendered version is available at this [link](https://structurizr.com/share/91641/24dd60f5-f95c-4b23-b477-9f4d3ebc6f3c).

1. Install VS Code extension - `systemticks.c4-dsl-extension`

1. Pull image:

    ```sh
    docker pull structurizr/lite
    ```

1. Run:

    ```sh
    docker run -it --rm -p 8080:8080 -v ./architecture:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=. structurizr/lite
    ```

1. Learn more - [link](https://github.com/structurizr/)

### Alternatives

#### LikeC4

Not used in this project.

[link](https://likec4.dev/)

Features:

- arbitrarily deep nesting of layers

Currently missing functionality:

- custom colors
- custom shapes
- dynamic views

## Analytics

Command:

```sh
git fetch normalizer master:master
git log normalizer/master --no-merges --date=short --pretty=format:'%h | %an | %ad | %s' > data/commits.csv
```

- [commits](./data/commits.csv)
- [script](analytics_tools/commits.py)

## CI

Sample run ([link](https://github.com/objectionary/normalizer/actions/runs/8976635334)).

For each workflow on PR:

- Check the code via the `hlint` linter.
- Check the code formatting via the `fourmolu` formatter.
- Run `normalizer` unit tests, confluence tests, doctests on `Linux`.
- Run pipeline with EO on `Linux`, `Windows`, `macOS`.
  - Test without normalization.
  - Test with normalization.
- Commit updated `PHI` atoms.
- Update `normalizer` docs and commit changes.
- Save pipeline artifacts so that they can be inspected later.
- Produce a job summary with a report so that one can see metrics for the workflow.

Additionally, on `master`:

- build the site
- build `Haddock` docs and add them to the site
- build report and add it to the site
- publish the site

## Processes

### Proof team reports

- Danila sends a message to the team Telegram chat every Friday at 12:00. The message asks the proof team about their progress and provides a link to an issue for a report.
  - Messages and issues are scheduled for every week till early August. Issues are available in the `objectionary/proof` repository ([link](https://github.com/objectionary/proof/issues?q=is%3Aissue+is%3Aclosed+%5Breport%5D)).
- Nickolay, Anatoliy, Violetta reply.
- Anatoliy writes a report in the linked issue.
- At 18:00, Danila checks the issue and asks Anatoliy to add missing details.


## Documents

- [Quality Plan](https://docs.google.com/document/d/1Rt7J87Mq_zzY-1vyLrTlqFe23zezw4I41yJE73ObgGk/edit?usp=sharing)
- [ASS final presentation](https://docs.google.com/presentation/d/1yDkyhUldUwvb1oSDPrJzZHJGthF7Suc3T3OEuq3qOfY/edit?usp=sharing)
- [Risk management](https://docs.google.com/presentation/d/1T3vpHEK6slE48Gds3317EYC_Dxflhj-JY-KTjNE6hwg/edit?usp=sharing)
