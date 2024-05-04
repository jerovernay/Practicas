module Hoy where

--Ejercicio 1
{- problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
}
1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen (sin importar el orden) son iguales.
 -}

-- No hay tuplas repetidas
-- No hay tuplas iguales, tal que (a,a) o (b,b) o (a, b), si solo si existe (b,a)

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

-- Pasar de una lista de tuplas a una lista singular

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

amigosDe :: String -> [(String, String)] -> [String]
amigosDe "nadie" [] = ["nadie"]
amigosDe persona ((a,b):xs) = amigosDeAux persona ((a,b):xs) []

amigosDeAux :: String -> [(String,String)] -> [String] -> [String] 
amigosDeAux _ [] [] = []
amigosDeAux _ [x] y = y
amigosDeAux persona ((a,b):xs) l1
  | persona == a && not (pertenece b l1) = amigosDeAux persona xs (b:l1)
  | persona == b && not (pertenece a l1) = amigosDeAux persona xs (a:l1)
  | otherwise = amigosDeAux persona xs l1


{- Ejercicio 4
problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
  requiere: {relaciones no vacía}
  requiere: {relacionesValidas(relaciones)}
  asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)} -}

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = "yo"
personaConMasAmigos l1 = personaConMasAmigosAux l1 (personas l1)

personaConMasAmigosAux :: [(String, String)] -> [String] -> String
personaConMasAmigosAux _ [] = "nadie"
personaConMasAmigosAux _ [w] = w
personaConMasAmigosAux l1 (x:y:xs)
  | longitud (amigosDe x l1) > longitud (amigosDe y l1) = personaConMasAmigosAux l1 (x:xs)
  | otherwise = personaConMasAmigosAux l1 (y:xs)

longitud :: [t] -> Integer
longitud [] =  0
longitud (x:xs) = 1 + longitud xs 
