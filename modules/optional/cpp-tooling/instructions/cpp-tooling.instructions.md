---
applyTo: "**/*.{c,cpp,h,hpp,cc,cxx}"
---

# C++ Tooling Instructions — {{PROJECT_NAME}} / {{MODULE_NAME}}

Apply when `LANGUAGE` is C or C++ and the cpp-tooling optional module is enabled.

## Formatting

- Use `.clang-format` at the module root (`02_Code/{{AREA_NAME}}/{{MODULE_NAME}}/.clang-format`).
- Run `clang-format -i` on changed source files before commit when the tool is available.
- Match `{{BRACE_STYLE}}` and `{{INDENT_WIDTH}}` from `PROJECT_PARAMETERS.md`.

## Documentation

- Use `{{DOC_COMMENT_STYLE}}` comment blocks (typically Doxygen).
- Regenerate API docs with Doxygen from module root: `doxygen Doxyfile` (output under `docs/doxygen/`).
- Keep the human-readable API manual at `{{MODULE_ROOT_PATH}}{{MODULE_NAME}}{{API_DOC_SUFFIX}}` in sync.

## Include Guards

When `USE_INCLUDE_GUARDS` is `true`, use `#ifndef NAMESPACE_FILENAME_HPP` style — no `#pragma once`.

## Language Standard

Enforce **{{LANGUAGE_STANDARD}}** only — do not use later standard features without updating parameters.
