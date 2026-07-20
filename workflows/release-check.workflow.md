# Release Check Workflow

## Pre-release checklist

- [ ] All Must REQ for release milestone implemented and verified
- [ ] `Design/_index.md` reflects current REQ status
- [ ] Test reports in `Test/{{AREA}}/reports/` for critical areas
- [ ] No open blocker bugs
- [ ] Documentation updated for public API changes
- [ ] VERSION bumped per `{{VERSIONING_SCHEME}}`
- [ ] Validation gate passed if enabled

## Activities

1. Run `#req-review` across affected areas
2. Run full test suite / CI pipeline
3. Produce release summary (changes, known issues, migration notes)
4. Tag release in Git when applicable

## Output

Release notes in `{{PROJECT_LANGUAGE}}` at project root or `docs/releases/`.
