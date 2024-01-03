# Build and Release

This action will create a new build of a component, and then a new release using that build. It's an easy to way to automate deploying updates to your installs.

This is a composite action that uses the [Nuon CLI](https://docs.nuon.co/quickstart#installing-the-cli-and-terraform-provider). If you need a more sophisticated integration, you can use the CLI directly from your Github Action workflows (or any other automation platform.)

Refer to [our docs](https://docs.nuon.co) for more information on builds, releases, and the Nuon platform generally.

## Inputs

- org_id: Your Nuon org ID.
- api_token: A valid Nuon API token for your org.
- component_id: The ID of the component you want to update and deploy.
- delay: How long to wait between each release step. _Optional_
- installs_per_step: How many installs to deploy to per release step. _Optional_

## Outputs

- build_id: The ID of the build that was created.
- release_id: The ID of the release that was created.

## Example Usage

The typical use-case for this action is to run it when updates are made to your component config or source code. For example:

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
      - name: Checkout code
        id: checkout
        uses: actions/checkout@v2
      - name: Deploy with Nuon
        id: deploy
        uses: nuonco/actions-build-and-release@v1
        with:
          api_token: ${{ secrets.API_TOKEN }}
          org: orgzblonf9hol7jq92vkdriio4
          component_id: cmpurwbae16j02k55607o2k6wb
```
