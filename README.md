# Koha Plugin kpz Builder

This action builds a kpz file from a given name and version.
The file will be in your GitHub workspace after the action is run.

## Inputs

### `release-version`

**Required** Version for this koha plugin release, e.g. `v1.0.3`

### `release-name`

**Required** Name of plugin, should almost always be the repo name, e.g. `koha-plugin-kitchen-sink`

### `minimmum-version`

**Required** Minimum version of Koha this plugin is compatible with, e.g. `19.11` or `19.11.03`

Best practice is to keep plugins compatible across all currently supported versions of Koha

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
    minimum-version: ${{ steps.koha-version-oldstable.outputs.version-major-minor }}
```

Take a look at https://github.com/bywatersolutions/koha-plugin-kitchen-sink/blob/master/.github/workflows/main.yml for a real world usage.
