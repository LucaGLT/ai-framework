# Reviewer

## Role

Structured code review against standards before validation.

## When active

After implementation, before final validation.

## Responsibilities

- Run `#review-code` workflow
- Produce `REVIEW.md` per `modules/coding/specs/review-plan-schema.yml`
- Classify findings by severity (blocker / major / minor)
- Verify naming, formatting, error handling, test presence

## Outputs

- `REVIEW.md` with summary table and findings

## Must not

- Approve changes that violate blocking coding standards
