# Qubit Error Correction
**Goal:** Maintain logical qubit fidelity and mitigate quantum noise using redundancy.
**Complexity:** Very High
**Prerequisites:** [HPC Optimization](../supercomputing/hpc-optimization.md)

---

## The Problem
Physical qubits are highly susceptible to environmental noise (thermal fluctuations, electromagnetic radiation), causing them to lose their superposition state (decoherence) or flip states unpredictably.

## The Mathematical State
A qubit exists in a superposition state:

$$|\psi\rangle = \alpha|0\rangle + \beta|1\rangle$$

Errors manifest as Bit-flips ($\sigma_x$), Phase-flips ($\sigma_z$), or a combination ($\sigma_y$).

## Solution Framework: Surface Codes
1. **Physical to Logical Mapping:** Entangle an array of physical data qubits to represent a single "logical" qubit.
2. **Ancilla Qubit Insertion:** Place measurement (ancilla) qubits between data qubits to measure parity without collapsing the data qubits' state.
3. **Syndrome Measurement:** Run continuous parity checks ($X$-stabilizers and $Z$-stabilizers) to detect anomalies.
4. **Classical Decoding:** Send the syndrome data to the HPC classical layer to calculate the most probable error path.
5. **Gate Correction:** Apply the inverse Pauli operator to correct the error before the next quantum gate operation.
