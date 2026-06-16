# Sol-Plex System Dashboard

## Core Engine Metrics
| Engine Component | Status | Latency |
| :--- | :--- | :--- |
| `src/lib.rs` (Rust Core) | 🟢 Operational | 0.4ms |
| `cognitive/search-agent` | 🟡 Iterating | 42.1ms |
| `discovery-engine` | 🔵 Idle | - |

## Infrastructure State
* **Container Layer:** Dockerized via multi-stage runtime.
* **GCP Infrastructure:** Verified state via Terraform.
* **Memory Management:** Redis cache connection pool active.

# Sol-Plex Control Center
Navigate the system based on your needs.

## Frameworks (Theory)
* `[Analytical](frameworks/analytical/)`: First Principles, 5 Whys.
* `[Systems](frameworks/systems/)`: Feedback Loops, Scenarios.

## Tools (Templates)
* `[Worksheets](templates/)`: Standardized input forms.

## Workflows (Execution)
* `[Recipes](workflows/)`: Step-by-step problem-solving sequences.

## Support
* `[Architecture](docs/architecture.md)`
* `[Roadmap](ROADMAP.md)`
* `[Guidelines](docs/CONTRIBUTING_GUIDELINES.md)`
