--Implementar una funci´on estanRelacionados :: Integer ->Integer ->Bool
--problema estanRelacionados (a:Z, b:Z) : Bool {
--requiere: {a ̸= 0 ∧ b ̸= 0}
--asegura: {(res = true) ↔ a ∗ a + a ∗ b ∗ k = 0 para alg´un k ∈ Z con k ̸= 0)}
--}
--Por ejemplo:
--estanRelacionados 8 2 ⇝ True porque existe un k = −4 tal que 82 + 8 × 2 × (−4) = 0.
--estanRelacionados 7 3 ⇝ False porque no existe un k entero tal que 72 + 7 × 3 × k = 0.

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b| a `mod` b == 0 = True
                     | otherwise = False
