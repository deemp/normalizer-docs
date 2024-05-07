# Normalizer documentation

Additional documentation for the [normalizer](https://github.com/objectionary/normalizer) project.

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
        mid-May - June
            : Implement EO team proposals
            : Extend dataization support
            : Optimize normalizer to work well on a Spring application
            : Work on a confluence proof for Extended PHI
            : Study SOAS
            : Work on a patent
            : Release eo-phi-normalizer 0.5.0    

    section Stage 2 (July-September)
        July-September
            : Finish confluence proof for Extended PHI
            : Work on a proof via SOAS
            : Work on an academic paper on the normalizer
            : Optimize the normalizer
    section Stage 3 (October-December)
        October-December
            : Write a confluence proof generator
            : Submit an academic paper on the normalizer
```

## Architecture

### Utility tree

See [Utility Tree](https://github.com/objectionary/normalizer/issues/321).

### Structurizr

The diagrams are described in the [Structurizr DSL](https://docs.structurizr.com/dsl).

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

## Stand-up bot

[repo link](https://github.com/deemp/scrum-standup-telegram-bot)

