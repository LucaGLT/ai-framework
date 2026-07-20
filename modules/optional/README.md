# Optional Modules

Plug-in extensions activated via parameters (`depends_on` in `specs/parameters.yml`).

| Module | Path | When |
|--------|------|------|
| GUI theming (PySide6/Qt) | [`gui-theming/`](gui-theming/README.md) | `HAS_GUI_MODULE = true` |
| C++ tooling | [`cpp-tooling/`](cpp-tooling/README.md) | `LANGUAGE in [C, C++]` |

Each module is self-contained: own `instructions/`, `specs/`, `prompts/`.
