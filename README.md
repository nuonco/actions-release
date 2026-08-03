# Nuon Release action (retired)

This action is retired because the legacy Nuon release API and CLI were removed.

Existing immutable tags remain available for historical reference, but they do not work with current Nuon control planes and CLIs. Do not add this action to new workflows.

Use one of the current deployment paths instead:

- **Multi-install rollout:** Configure and run an App Branch in the Nuon dashboard.
- **Single-install deployment:** Run `nuon installs components deploy --install-id <install-id> --component-id <component-id> --build-id <build-id>`.
- **Component build:** Use [`nuonco/actions-build`](https://github.com/nuonco/actions-build).

If a reusable GitHub Action for App Branch runs is added later, it should be a separate action with an explicit App Branch contract rather than changing the meaning of this repository.
