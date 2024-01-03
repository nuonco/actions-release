# Release Build

This action will create a new release of a build.

This is a composite action that uses the [Nuon CLI](https://docs.nuon.co/quickstart#installing-the-cli-and-terraform-provider). If you need a more sophisticated integration, you can use the CLI directly from your Github Action workflows (or any other automation platform.)

Refer to [our docs](https://docs.nuon.co) for more information on builds, releases, and the Nuon platform generally.

## Inputs

- org_id: Your Nuon org ID.
- api_token: A valid Nuon API token for your org.
- build_id: The ID of the build you want to release.
- component_id: Instead of specifying a build, use the latest build of a component. _If build_id is set, component_id will be ignored._
- delay: How long to wait between each release step. _Optional_
- installs_per_step: How many installs to deploy to per release step. _Optional_

## Outputs

- release_id: The ID of the release that was created.

## Example Usage

The typical use-case for this action is to run it when your component has been tested and built, and is ready to be released to installs. For example:

```yaml
on:
  push:
    branches: main
    paths:
      - 'components/my-component/**'
      - 'nuon/my-component.tf'
jobs:
  deploy:
    runs-on: ubuntu-latest
    name: Release
    steps:
      - name: Release
        id: release
        uses: nuonco/actions-release@v1
        with:
          api_token: ${{ secrets.nuon_api_token }}
          org: ${{ vars.nuon_org_id
          component_id: ${{ vars.nuon_component_id }}
```

You can also combine this with the [build action](https://github.com/nuonco/actions-build) to create a new build and release it.

```yaml
on:
  push:
    branches: main
    paths:
      - 'components/my-component/**'
      - 'nuon/my-component.tf'
jobs:
  deploy:
    runs-on: ubuntu-latest
    name: Deploy
    steps:
      - name: Build
        id: build
        uses: nuonco/actions-build@v1
        with:
          api_token: ${{ secrets.nuon_api_token }}
          org: ${{ vars.nuon_org_id
          component_id: ${{ vars.nuon_component_id }}
      - name: Release
        id: release
        uses: nuonco/actions-release@v1
        with:
          api_token: ${{ secrets.nuon_api_token }}
          org: ${{ vars.nuon_org_id
          build_id: ${{ steps.build.outputs.build_id }}
```
