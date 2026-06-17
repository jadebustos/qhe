## Single-qubit quantum gates

Single-qubit gates are $2\times 2$ unitary matrices. A few you'll see repeatedly:

| Gate | Symbol | Matrix |
|------|--------|--------|
| Hadamard | $H$ | $\tfrac{1}{\sqrt{2}}\begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix}$ |
| Pauli-X | $X$ | $\begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$ |
| Phase | $S$ | $\begin{pmatrix} 1 & 0 \\ 0 & i \end{pmatrix}$ |

$H$ creates superposition: $H|0\rangle = \tfrac{1}{\sqrt{2}}(|0\rangle + |1\rangle)$.