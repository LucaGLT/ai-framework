# Architecture Rules

## Structure

Target projects use **Design / Code / Test** × **Areas of intervention**.

- Cross-area dependencies: document in DEC or REQ
- Module path: `02_Code/{{AREA_NAME}}/{{MODULE_NAME}}/`
- Optional dedicated repo: `EXTERNAL_REPOSITORIES.md` entry only

## Design principles

- Minimal viable change for each REQ
- ADR (DEC-XXXX) for structural decisions
- No circular dependencies between modules
- Follow `CROSS_MODULE_POLICY` (default: bridges/adapters only)

## Diagrams

Architecture diagrams in `Design/areas/{{AREA}}/architecture/` — ASCII or Mermaid in markdown.

## Review

Architect role (`agents/architect.md`) before large or cross-cutting changes.
