# Documentation Rules

## Style

Follow `{{DOC_COMMENT_STYLE}}` from module parameters:

| Style | Typical languages |
|-------|-----------------|
| Doxygen | C, C++ |
| JSDoc | JavaScript, TypeScript |
| Docstring | Python |
| JavaDoc | Java |

## Public API

Document all public functions, classes, modules:

- Purpose and behaviour
- Parameters and return values
- Errors / exceptions
- Thread-safety or constraints when relevant

Do not restate obvious code — explain intent and contracts.

## Project language

All user-facing docs and comments in `{{PROJECT_LANGUAGE}}` — never mixed with another language.

## Markdown

Follow `modules/coding/instructions/markdown-style.instructions.md` for `*.md` files.

## Doxygen-specific (C/C++)

When `DOC_COMMENT_STYLE=Doxygen`, use `@brief`, `@param`, `@return`, `@pre`, `@post` where applicable.

See optional C++ module tooling (Phase 2) for `.clang-format` alignment.
