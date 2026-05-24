## Shor's algorithm

:::{admonition} Why this matters for HE
:class: tip

Quantum algorithms like Shor's break the integer-factorisation and discrete-log problems that secure RSA and elliptic-curve algorithms {cite}`shorAlgorithmsQuantumComputation1994`. Modern HE schemes (BFV, BGV, CKKS) instead rest on **lattice problems** {cite}`ajtaiGeneratingHardInstances1996` that are believed to resist quantum attacks {cite}`10.1145/1536414.1536440`.
:::