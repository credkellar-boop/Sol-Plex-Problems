# OODA Loop Operational Playbook

## 1. Observe
* Continuous metric sampling via `src/workflows/` telemetry hooks.
* Identify systemic deviation from established base thresholds.

## 2. Orient
* Map anomaly data points against current `frameworks/systems/` models.
* Evaluate if failure point is deterministic (Complicated) or systemic (Complex).

## 3. Decide
* If Complicated: Trigger automated infrastructure remediation via `scripts/deploy-helper.sh`.
* If Complex: Isolate the state slice inside Redis and spin up an alternative `search-agent` iteration.

## 4. Act
* Execute state modification.
* Log output results back to the `DASHBOARD.md` to feed the next observation cycle.
