# Sol-Plex System Dashboard

## 📊 Core Engine Metrics
| Engine Component | Status | Latency | Thread Pool | Type |
| :--- | :--- | :--- | :--- | :--- |
| `src/lib.rs` (Rust Core) | 🟢 Operational | 0.4ms | 16/16 (Rayon) | Complicated |
| `cognitive/search-agent` | 🟡 Iterating | 42.1ms | Dynamic | Complex |
| `discovery-engine/` | 🟢 Idle | — | — | Complex |

## 🛠 Infrastructure State
* **Container Layer:** Dockerized via multi-stage runtime.
* **GCP Infrastructure:** Verified state via Terraform.
* **Memory Management:** Redis cache connection pool active.


# Sol-Plex Control Center
Navigate the system based on your needs.

## 🧠 Frameworks (Theory)
- [Analytical](frameworks/analytical/): First Principles, 5 Whys.
- [Systems](frameworks/systems/): Feedback Loops, Scenarios.
- [Design Thinking](frameworks/design-thinking/): Empathy, Prototyping.
- [Decision Making](frameworks/decision-making/): OODA, Pre-Mortems.

## 🛠️ Tools (Templates)
- [Worksheets](templates/): Standardized input forms.

## 🚀 Workflows (Execution)
- [Recipes](workflows/): Step-by-step problem-solving sequences.

## ⚙️ Support
- [Architecture](docs/ARCHITECTURE.md) | [Roadmap](ROADMAP.md) | [Guidelines](docs/CONTRIBUTING_GUIDELINES.md)

