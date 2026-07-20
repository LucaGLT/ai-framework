# Test Module

Prompts and specs for the Test layer (`Test/{{AREA}}/`).

## Prompts

| Prompt | File | Purpose |
|--------|------|---------|
| `#test-case-create` | `prompts/test-case-create.prompt.md` | Create TC-XXXX |
| `#bug-create` | `prompts/bug-create.prompt.md` | Create BUG-XXXX |
| `#validation-report` | `prompts/validation-report.prompt.md` | Quality score JSON |

## Templates

Global templates in `ai-framework/templates/`:

- `test-case.template.yaml`
- `bug.template.yaml`
- `validation-report.template.json`

## Rubric

Scoring: `validators/validation-rubric.yaml`

## Workflow

End-to-end cycle: `workflows/end-to-end.workflow.md`
