# Cursor Adapter

Copy to target project on instantiation:

| Source | Target |
|--------|--------|
| `rules/*.mdc` | `.cursor/rules/` |
| `mcp.json` | `.cursor/mcp.json` |

Rules are numbered 00–90 for load order. See `_RAW/ai-framework-guide_1.0.md` §7.3.

To add an MCP server, edit `mcp.json` — never commit secrets; use environment variables.

Example server (do not enable until needed):

```json
{
  "mcpServers": {
    "example-server": {
      "command": "npx",
      "args": ["-y", "@example/mcp-server"],
      "env": {
        "API_KEY": "${env:EXAMPLE_API_KEY}"
      }
    }
  }
}
```
