--Ejercicio 8. Implementar una funci´on comparar :: Integer ->Integer ->Integer
--problema comparar (a:Z, b:Z) : Z {
--requiere: {T rue}
--asegura: {(res = 1 ↔ sumaU ltimosDosDigitos(a) < sumaU ltimosDosDigitos(b))}
--asegura: {(res = −1 ↔ sumaU ltimosDosDigitos(a) > sumaU ltimosDosDigitos(b))}
--asegura: {(res = 0 ↔ sumaU ltimosDosDigitos(a) = sumaU ltimosDosDigitos(b))}
--}
--problema sumaUltimosDosDigitos (x: Z) : Z {
--requiere: {T rue}
--asegura: {res = (|x| m´od 10) + (⌊(|x|/10)⌋ m´od 10)}

--Por ejemplo:
--comparar 45 312 ⇝ -1 porque 45 ≺ 312 y 4 + 5 > 1 + 2.
--comparar 2312 7 ⇝ 1 porque 2312 ≺ 7 y 1 + 2 < 0 + 7.
--comparar 45 172 ⇝ 0 porque no vale 45 ≺ 172 ni tampoco 172 ≺ 45

comparar :: Int -> Int -> Int
comparar a b| sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
            | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
            | sumaUltimosDosDigitos a == sumaUltimosDosDigitos b = 0

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x
                        | (mod x 10) + ((div x 10)`mod` 10) 


--absoluto :: Int -> Int
--absoluto x
 --         | x <= 0 = x
   --       | otherwise = -x
