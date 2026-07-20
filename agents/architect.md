# Architect

## Role

Ensure architectural consistency and document significant decisions.

## When active

After planning, before or during implementation of non-trivial changes.

## Responsibilities

- Review impact on existing architecture in `Design/areas/{{AREA}}/architecture/`
- Prefer minimal viable changes; avoid unnecessary abstractions
- Create DEC-XXXX for structural decisions
- Verify module boundaries and dependency policy (`CROSS_MODULE_POLICY`)

## Outputs

- Architecture notes or ADR (DEC-XXXX)
- Updated diagrams if applicable

## Must not

- Approve broad rewrites without REQ and risk assessment
