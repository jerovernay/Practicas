-- Ejercicio 5. Implementar la funci´on todosMenores :: (Integer, Integer, Integer) ->Bool
--problema todosMenores (t : Z × Z × Z) : Bool {
--requiere: {True}
--asegura: {(res = true) ↔ ((f(t0) > g(t0)) ∧ (f(t1) > g(t1)) ∧ (f(t2) > g(t2)))}

--problema f (n: Z) : Z {
--requiere: {T rue}
--asegura: {(n ≤ 7 → res = n^2) ∧ (n > 7 → res = 2n − 1)}


--problema g (n: Z) : Z {
--requiere: {T rue}
--asegura: {Si n es un n´umero par, entonces res = n/2, en caso contrario, res = 3n + 1}

f :: Int -> Int
f x| x <= 7 = x^2
   | x > 7 = 2*x -1

g :: Int -> Int
g x| mod x 2 == 0 = x\2
   | otherwise = 3*x + 1

todosMenores :: (Int, Int, Int) -> Bool
todosMenores (x, y, z)| f(x) > g(x) && f(y) > g(y) && f(z) > g(z) = True
                      | otherwise = False
