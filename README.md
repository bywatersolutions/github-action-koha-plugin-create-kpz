# Koha Plugin kpz Builder

This action builds a kpz file from a given name and version.
The file will be in your GitHub workspace after the action is run.

## Inputs

### `release-version`

**Required** Version for this koha plugin release, e.g. "v1.0.3"

### `release-name`

**Required** Name of plugin, should almost always be the repo name, e.g. "koha-plugin-kitchen-sink"

## Outputs

### `filename`

The name of the built kpz file

## Example usage

```yaml
uses: actions/github-action-koha-plugin-create-kpz@v1
with:
  release-version: 'v1.2.3'
  release-name: 'koha-plugin-kitchen-sink'
```
