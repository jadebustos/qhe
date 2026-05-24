# Homomorphic encryption in 5 minutes

A **homomorphic** encryption scheme lets you compute on ciphertexts.
If $\mathrm{Enc}$ is encryption and $\oplus, \otimes$ are operations on
ciphertexts, the scheme satisfies:

$$
\mathrm{Dec}(\mathrm{Enc}(a) \oplus \mathrm{Enc}(b)) = a + b,
\qquad
\mathrm{Dec}(\mathrm{Enc}(a) \otimes \mathrm{Enc}(b)) = a \cdot b.
$$

A server can therefore evaluate a function $f$ on your encrypted data
and return $\mathrm{Enc}(f(x))$ — without ever learning $x$.

## A quick taxonomy

- **Partially HE (PHE)**: supports *one* operation an unbounded number
  of times. RSA is multiplicatively homomorphic; Paillier is additively.
- **Somewhat HE (SHE)**: supports both, but for a bounded number of
  operations before noise overwhelms the ciphertext.
- **Fully HE (FHE)**: arbitrary circuits. Made practical by Gentry's
  2009 breakthrough using *bootstrapping* {cite}`gentry2009`.

Modern FHE schemes most thesis projects touch:

- **BFV / BGV** — integer arithmetic
- **CKKS** — approximate arithmetic on real/complex numbers (great for
  ML inference on encrypted inputs)
- **TFHE** — fast bootstrapping, good for Boolean circuits

## Where quantum enters

Two angles worth exploring:

1. **Post-quantum security** of FHE. The hardness assumptions (LWE,
   RLWE) are believed to be quantum-resistant.
2. **Quantum HE** — schemes that encrypt *quantum* states and allow a
   server to apply quantum circuits blindly. An active research area.

The next chapter is a runnable notebook to make this concrete.
