# Mendix CLI

A set of Command line interface tools for Mendix developers, CICD engineers and platform engineers.

## export-model

Mendix models are stored in a binary file with `.mpr` extension. This project exports Mendix model to a human readable format, such as Yaml. This enables developers to use traditional code analysis tools on Mendix models. Think of quality checks like linting, code formatting, etc.

![Mendix Model Exporter](./resources/model-new-entity.png)

See each Mendix document/object as a separate file in the output directory. And see the differences between versions in a version control system. Here we changed the `Documentation` of an entity and added a new `Entity` with one `Attribute`.

### pre-commit hook setup

> As of this writing, Mendix Studio Pro does not support Git hooks. You can use the following workaround to automatically export your Mendix model to Yaml before each commit. Make sure you have git-bash installed on your system. It is already present if you use Mendix 10. If you don't have it, download from [here](https://git-scm.com/download/win).

Open git-bash inside of your project directory (use `cd Mendix/project-name` if needed) and run the following commands:

```bash
curl https://github.com/cinaq/mendix-cli/raw/main/pre-commit -o .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

# try it out
.git/hooks/pre-commit
```

Now whenever you commit using git-bash, the Mendix model will be exported to Yaml before the commit. The changes will be included automatically.

### Features

- Export Mendix model to Yaml
- Incremental changes
- Human readable output

### TODO

- [x] Export Mendix model to Yaml
- [x] Improve output human readability
- [ ] Expand test coverage
- [ ] Support incremental changes
- [ ] Improve performance for large models
- [ ] Improve error handling
- [ ] Transform flows (activities, decisions, etc.) to pseudo code

## lint

Lint Mendix Yaml files. This tool checks for common mistakes and enforces best practices.

## Contribute

Create a PR with your changes. We will review and merge it.

Make sure to run the tests before creating a PR:

```bash
make test
```
