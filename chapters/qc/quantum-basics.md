# Quantum computing in 5 minutes

A **qubit** is the quantum analogue of a classical bit. Where a bit is either $0$ or $1$, a qubit's state is a unit vector in $\mathbb{C} ^2$:

$$
|\psi\rangle = \alpha\,|0\rangle + \beta\,|1\rangle,
\qquad |\alpha|^2 + |\beta|^2 = 1.
$$

The coefficients $\alpha, \beta \in \mathbb{C}$ are called *amplitudes*. On measurement in the computational basis, you observe $0$ with probability $|\alpha|^2$ and $1$ with probability $|\beta|^2$ where $|\alpha|^2 + |\beta|^2 = 1$.

## Gates

Single-qubit gates are $2\times 2$ unitary matrices. A few you'll see repeatedly:

| Gate | Symbol | Matrix |
|------|--------|--------|
| Hadamard | $H$ | $\tfrac{1}{\sqrt{2}}\begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix}$ |
| Pauli-X | $X$ | $\begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$ |
| Phase | $S$ | $\begin{pmatrix} 1 & 0 \\ 0 & i \end{pmatrix}$ |

$H$ creates superposition: $H|0\rangle = \tfrac{1}{\sqrt{2}}(|0\rangle + |1\rangle)$.

```{admonition} Why this matters for HE
:class: tip
Quantum algorithms like Shor's break the integer-factorisation and discrete-log problems that secure RSA and elliptic-curve algorithms {cite}`shorAlgorithmsQuantumComputation1994`. Modern HE schemes (BFV, BGV, CKKS) instead rest on **lattice problems** {cite}`ajtaiGeneratingHardInstances1996` that are believed to resist quantum attacks — see {cite}`10.1145/1536414.1536440`.
```

Next chapter: what "homomorphic" actually means.
