# Quantum Key Distribution (QKD)
**Goal:** Achieve theoretically unbreakable, physics-based encryption for node-to-node transmission.
**Complexity:** Extreme
**Prerequisites:** [Decoherence Mitigation](../super-quantum/decoherence-mitigation.md)

---

## The Problem
Classical asymmetric encryption (RSA, ECC) is vulnerable to Shor's algorithm on quantum computers. Any intercepted encrypted data transmitted today can be decrypted tomorrow once quantum advantage is reached ("Harvest Now, Decrypt Later").

## The Mathematical State (BB84 Protocol)
Security relies on the No-Cloning Theorem. An eavesdropper attempting to measure a qubit in transit forces wave-function collapse, altering the state and revealing the intrusion.

If Alice sends a state in basis $+$, and Bob measures in basis $\times$, the probability of Bob guessing the correct state is:
$$P(\text{match}) = |\langle \psi_{Bob} | \psi_{Alice} \rangle|^2 = 0.5$$

## Solution Framework: BB84 QKD Implementation
1. **State Preparation:** Alice generates a random bit string and encodes it into photons using randomly selected bases (Rectilinear $+$ or Diagonal $\times$).
2. **Quantum Transmission:** Photons are sent to Bob via a quantum channel (fiber optic or free space).
3. **Random Measurement:** Bob measures incoming photons using randomly selected bases.
4. **Classical Sifting:** Alice and Bob publicly share the *bases* they used (not the results) via a classical channel. They discard bits where bases did not match.
5. **Error Estimation:** They compare a subset of the remaining bits. If the error rate exceeds the quantum noise threshold (typically $> 11\%$), eavesdropping is assumed, and the key is aborted.
6. **Privacy Amplification:** Hash functions are applied to the raw key to eliminate any partial information an eavesdropper might have extracted.
