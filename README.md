<!-- mcp-name: earth.edk/mcp -->
# EDK-1 MCP server

[![npm](https://img.shields.io/npm/v/@edks/mcp?color=e0a458&label=npm)](https://www.npmjs.com/package/@edks/mcp)
[![MCP Registry](https://img.shields.io/badge/MCP%20Registry-earth.edk%2Fmcp-9cb46a)](https://registry.modelcontextprotocol.io/v0/servers?search=earth.edk)
[![License: MIT](https://img.shields.io/badge/license-MIT-8fb3c0)](LICENSE)

A compass for the physical world, for any agent that speaks MCP. Ask in plain language and EDK-1 answers with real places: where things are, what the ground is like, how to get there, and what just changed.

```
"Graffiti near train stations in Chicago"
"What's the flood risk and income around 40.44, -79.99?"
"Drive from Denver to Boulder past a coffee shop, avoiding flood-prone streets"
"Tell me when new demolition permits are filed in Brooklyn"
```

Results carry coordinates, imagery and an `embed_url` that opens them on the [EDK Atlas](https://edk.earth/atlas).

## Tools

| Tool | What it does |
| --- | --- |
| `edk_discover` | Find places and areas in plain language: things you can see (bridges, graffiti, solar farms), civic records (permits, 311, inspections, crashes) and areas that meet conditions (income, flood depth, tree canopy). Choose `reasoning` from `fast` to `max` for results studied more closely, returned with the feature boxed on its photo. |
| `edk_inspect` | Everything known about one point: place, highlights and every measured fact by category, from sunlight and soil to jobs and air quality. |
| `edk_route` | A route from A to B that passes what you want to see and steers around what you want to avoid, with turn-by-turn steps. |
| `edk_monitor_create` | Watch an area for new events (permits, 311 requests, imagery…) on an interval, delivered by webhook. |
| `edk_monitor_events` | List monitors and the events they found. |
| `edk_usage` | Compute Unit balance, tier and limits. |

## Setup

1. Sign up at [edk.earth](https://edk.earth). Every account gets 500 free Compute Units a month.
2. Create a secret key in **Console → API Keys**.
3. Add the server to your client with `EDK_API_KEY` set.

**Claude Code**

```sh
claude mcp add edk --env EDK_API_KEY=edk_sk_... -- npx -y @edks/mcp
```

**Claude Desktop** (`claude_desktop_config.json`), **Cursor** (`.cursor/mcp.json`), **Windsurf** and **Gemini CLI** (`~/.gemini/settings.json`)

```json
{
  "mcpServers": {
    "edk": {
      "command": "npx",
      "args": ["-y", "@edks/mcp"],
      "env": { "EDK_API_KEY": "edk_sk_..." }
    }
  }
}
```

**VS Code** (`.vscode/mcp.json`)

```json
{
  "inputs": [{ "type": "promptString", "id": "edk-key", "description": "EDK API key", "password": true }],
  "servers": {
    "edk": {
      "command": "npx",
      "args": ["-y", "@edks/mcp"],
      "env": { "EDK_API_KEY": "${input:edk-key}" }
    }
  }
}
```

**Codex** (`~/.codex/config.toml`)

```toml
[mcp_servers.edk]
command = "npx"
args = ["-y", "@edks/mcp"]
env = { EDK_API_KEY = "edk_sk_..." }
```

**Docker**

```sh
docker build -t edk-mcp . && docker run -i --rm -e EDK_API_KEY=edk_sk_... edk-mcp
```

## Pricing

Usage is metered in Compute Units (CU), the GPU and CPU work a request needs. Discover costs 0.2 CU per result, Monitor events 0.2 CU each. Higher reasoning levels use twice the compute. See [edk.earth/pricing](https://edk.earth/pricing).

## Links

- Docs: [edk.earth/docs](https://edk.earth/docs)
- Agents guide: [edk.earth/agents](https://edk.earth/agents)
- The data behind it: [edk.earth/elements](https://edk.earth/elements)

The server has no dependencies and needs Node 18 or later. `EDK_BASE_URL` points it at another API host.

MIT licensed.
