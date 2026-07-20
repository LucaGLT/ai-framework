# Milestone Catalog

Suggested milestone IDs for `#project-setup`. **Not mandatory** — pick any subset or define custom IDs.

Persist chosen list as `{{MILESTONE_LIST}}` in `PROJECT_PARAMETERS.md`.

---

## C++ library

| ID | Meaning |
|----|---------|
| `api-surface-defined` | Public API and headers established |
| `api-frozen` | No breaking changes except major version |
| `first-downstream-consumer` | First external module integrated successfully |
| `performance-baseline` | Benchmarks and performance budget documented |
| `docs-complete` | API reference and user guides complete |

## Web / frontend app

| ID | Meaning |
|----|---------|
| `ux-wireframes-approved` | Wireframes and user flows approved |
| `auth-flow-complete` | Registration, login, sessions working |
| `core-journey-shippable` | Main user journey deployable |
| `accessibility-pass` | WCAG / accessibility criteria verified |
| `production-deploy` | Deployed to production |

## Firmware / embedded

| ID | Meaning |
|----|---------|
| `board-bring-up` | Hardware powered, debug, clock, memory OK |
| `bootloader-flashing` | Flash and boot from ROM/RAM verified |
| `hal-peripherals-ready` | Base HAL peripheral drivers complete |
| `app-logic-integrated` | Application logic integrated on RTOS/bare-metal |
| `field-trial-ready` | Ready for bench or field trial |

## Backend + frontend mix

| ID | Meaning |
|----|---------|
| `contract-defined` | API contract (OpenAPI/AsyncAPI) frozen |
| `backend-api-live` | Core endpoints deployed and tested |
| `frontend-wired` | UI connected to real backend |
| `e2e-critical-paths` | End-to-end tests green on critical flows |
| `staging-signoff` | Staging environment validation complete |

## Cross-cutting (any project type)

| ID | Meaning |
|----|---------|
| `requirements-baseline` | REQ set approved as baseline |
| `architecture-signoff` | Architecture reviewed and accepted |
| `integration-complete` | Components integrated, no critical stubs |
| `hardening-complete` | Bug fixes, security review, stability |
| `release-candidate` | Release candidate — blocker fixes only |

## Custom milestones

Format: `kebab-case-id` — short, domain-specific, meaningful to the project.

Example: `payment-provider-live`, `sensor-calibration-done`
