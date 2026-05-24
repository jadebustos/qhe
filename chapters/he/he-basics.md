# Homomorphic encryption in 5 minutes

A **homomorphic** encryption scheme lets you compute on ciphertexts. If $\mathrm{Enc}$ is encryption and $\oplus, \otimes$ are operations on ciphertexts, the scheme satisfies:

$$
\mathrm{Dec}(\mathrm{Enc}(a) \oplus \mathrm{Enc}(b)) = a + b,
\qquad
\mathrm{Dec}(\mathrm{Enc}(a) \otimes \mathrm{Enc}(b)) = a \cdot b.
$$

A server can therefore evaluate a function $f$ on your encrypted data and return $\mathrm{Enc}(f(x))$ — without ever learning $x$.

When we talk about homomorphic encryption we mean that the homomorphic algorithm is homomorphic for some mathematical operations. Most homomorphic algorithms will be homomorphic regarding addition and/or multiplication. That means that we can perform addition and/or multplication using the crypted data without having to decrypt it.

## A quick introduction to homomorphic encryption (HE)

Homomorphic encryption algorithms can be classified into:

- **Partially Homomorphic Encryption (PHE)**: supports *one* operation an unbounded number of times. RSA {cite}`rivestMethodObtainingDigital1978` is multiplicatively homomorphic; Paillier {cite}`10.5555/1756123.1756146` is additively.
- **Somewhat Homomorphic Encryption (SHE)**: supports both, but for a bounded number of operations before noise overwhelms the ciphertext.
- **Fully Homomorphic Encryption (FHE)**: arbitrary circuits. Made practical by Gentry's 2009 breakthrough using *bootstrapping* {cite}`10.1145/1536414.1536440`.

Modern FHE schemes most thesis projects are about the following algorithms:

- **BFV** {cite}`bfv2012`, which is a homomorphic encryption algorithm to perform integer arithmetic.
- **BGV** {cite}`BGV2014`, which is a homomorphic encryption algorithm to perform integer arithmetic.
- **CKKS** {cite}`ckks2017`, which is a homomorphic encryption algorithm to perform approximate arithmetic on real/complex numbers (great for ML inference on encrypted inputs).
- **TFHE** {cite}`CGGI20`, which is a homomorphic encryption algorithm supporting fast bootstrapping, good for Boolean circuits.

## Where quantum enters

Two angles worth exploring:

1. **Post-quantum security** of FHE. The hardness assumptions (LWE, RLWE) are believed to be quantum-resistant.
2. **Quantum HE** — schemes that encrypt *quantum* states and allow a server to apply quantum circuits blindly. An active research area.