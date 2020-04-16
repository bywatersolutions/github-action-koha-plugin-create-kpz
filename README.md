# Koha Plugin kpz Builder

This action builds a kpz file from a given name and version.
The file will be in your GitHub workspace after the action is run.

## Inputs

### `release-version`

**Required** Version for this koha plugin release, e.g. `v1.0.3`

### `release-name`

**Required** Name of plugin, should almost always be the repo name, e.g. `koha-plugin-kitchen-sink`

### `koha-version`

**Optional** Major and minor version of Koha. If this is passed in, it will be prepended to the plugin version

## Outputs

### `filename`

The name of the built kpz file

## Example usage

```yaml
- name: Build Koha Plugin kpz artifact
  id: kpz
  uses: "bywatersolutions/github-action-koha-plugin-create-kpz@master"
  with:
    release-version: ${{ steps.semvers.outputs.v_patch }}
    release-name: ${{ steps.myvars.outputs.GITHUB_REPO }}
    koha-version: 19.11
```

Take a look at https://github.com/bywatersolutions/koha-plugin-kitchen-sink/blob/master/.github/workflows/main.yml for a real world usage.
