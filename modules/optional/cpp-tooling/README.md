# Optional Module — C++ Tooling

> Include when `LANGUAGE` is `C` or `C++`.

## Purpose

Provides standard C/C++ developer tooling templates: `.clang-format` and `Doxyfile` for module roots.

## Contents

| Path | Purpose |
|------|---------|
| `templates/.clang-format` | LLVM-based formatter (Allman braces, 4-space indent) |
| `templates/Doxyfile` | Minimal Doxygen config for `{{DOC_COMMENT_STYLE}}=Doxygen` |
| `instructions/cpp-tooling.instructions.md` | When to regenerate docs and format code |

## Integration (by `#setup-environment`)

1. Copy `templates/.clang-format` → `02_Code/{{AREA}}/{{MODULE}}/.clang-format`
2. Copy `templates/Doxyfile` → `02_Code/{{AREA}}/{{MODULE}}/Doxyfile` (resolve `{{PROJECT_NAME}}`, `{{MODULE_NAME}}`)
3. Ensure `USE_INCLUDE_GUARDS=true` and `DOC_COMMENT_STYLE=Doxygen` in module parameters

## Parameters Used

- `{{PROJECT_NAME}}`, `{{MODULE_NAME}}`, `{{MODULE_ROOT_PATH}}`
- `{{DOC_COMMENT_STYLE}}`, `{{USE_INCLUDE_GUARDS}}`, `{{LANGUAGE_STANDARD}}`
