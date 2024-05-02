module Hoy where
--Ejercicio 1
{- problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
}
1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen (sin importar el orden) son iguales.
 -}

-- No hay tuplas repetidas
-- No hay tuplas iguales, tal que (a,a) o (b,b)

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = False
relacionesValidas [x] = True
relacionesValidas ((a,b):xs) = (a /= b) &&  noRepite (a,b) xs && relacionesValidas xs

noRepite :: (String,String) -> [(String, String)] -> Bool
noRepite (a,b) [] = True
noRepite (a,b) (x:xs) = (a,b) /= x && (b,a) /= x && noRepite x xs

{- Ejercicio 2
problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res no tiene elementos repetidos}
  asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones} -}

-- Usar la funcion anterior
-- Pasar de una lista de tuplas a una lista singu

personas :: [(String, String)] -> [String]
personas [] = ["nadie"]
personas ((a,b):xs) = personasAux ((a,b):xs) []

personasAux :: [(String, String)] -> [String] -> [String]
personasAux [] x = x
personasAux ((a,b):xs) l1 
    | not (pertenece a l1) && not (pertenece b l1) = personasAux xs (a:b:l1)
    | pertenece a l1 && not (pertenece b l1) = personasAux xs (b:l1)
    | not (pertenece a l1) && pertenece b l1 = personasAux xs (a:l1)
    | otherwise = personasAux xs l1


pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs)
    | n == x = True
    | otherwise = pertenece n xs



{- Ejercicio 3
problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona} -}

{- amigosDe :: String -> [(String, String)] -> [String]
amigosDe "nadie" [] = ["nadie"]
amigosDe " " [] = []
amigosDe persona ((a,b):xs)
    | persona == a =  -}
