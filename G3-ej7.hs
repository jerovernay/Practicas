--Ejercicio 7. Implementar una funci´on:
--distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) ->Float
--problema distanciaManhattan (p : R × R × R, q : R × R × R) : R {
--requiere: {T rue}
--asegura: {res =(Sigma)2 |pi − qi|}
--                  i=0
--Por ejemplo:
--distanciaManhattan (2, 3, 4) (7, 3, 8) ⇝ 9
--distanciaManhattan ((-1), 0, (-8.5)) (3.3, 4, (-4)) ⇝ 12.8

distanciaManhattan :: (Float, Float, Float) ->(Float, Float, Float) ->Float
