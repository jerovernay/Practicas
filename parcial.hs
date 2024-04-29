module Examen_clase where

-- NOTA: Estas son sólo comentarios/notas informales de un ayudante de catedra.
-- 

-- Ejercicio 1
-- relaciones validas son cuando:
-- 1. No hay una tupla con ambos elementos iguales.
-- 2. No hay una tupla que esté repetida en el resto de la lista. Entiendase repetida, como no
-- solamente de la forma, por ejemplo ("Jorge", "Pablo"), o ("Pablo", "Jorge").

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((a,b):xs) = (a /= b) && noEstaRepetida (a,b) xs && relacionesValidas xs

noEstaRepetida :: (String, String) -> [(String, String)] -> Bool
noEstaRepetida r [] = True
noEstaRepetida (a,b) (x:xs) = x /= (a,b) && x /= (b,a) && noEstaRepetida x xs

-- También pueden expresar los mismo con guardas, en este caso sería:
-- relacionesValidas :: [(String, String)] -> Bool
-- relacionesValidas [] = True
-- relacionesValidas ((a,b):xs) | a == b                = False
--                              | estaRepetida (a,b) xs = False -- La guarda debe ser un booleano, una función que devuelve un booleano está excelente.
--                              | otherwise             = relacionesValidas xs

-- estaRepetida :: (String, String) -> [(String, String)] -> Bool
-- estaRepetida r [] = False
-- estaRepetida (a,b) (x:xs) | (a,b) == x = True -- Si vuelve a aparecer la misma, o la invertida, entonces esta repetida!
--                           | (b,a) == x = True
--                           | otherwise = estaRepetida x xs -- Sino, seguimos revisando en el resto de la lista (la cola).

-- Ejercicio 2

-- FORMA 1: Llamo a una función auxiliar con un parámetro extra donde incialmente pondré una lista vacia.
-- En esa lista vacias, es donde voy a ir metiendo las personas, siempre y cuando esa persona no este ya en
-- en la lista, para evitar los repetidos.

-- personas :: [(String, String)] -> [String]
-- personas r = personasAux r []

-- personasAux :: [(String, String)] -> [String] -> [String]
-- personasAux [] l = l
-- personasAux ((a,b):xs) l
--     | not (pertenece a l) && not (pertenece b l) = personasAux xs (a:b:l)
--     | pertenece a l && not (pertenece b l) = personasAux xs (b:l)
--     | not (pertenece a l) && pertenece b l = personasAux xs (a:l)
--     | otherwise = personasAux xs (l)

-- pertenece :: (Eq t) => t -> [t] -> Bool
-- pertenece _ [] = False
-- pertenece e (x:xs) = e == x || pertenece e xs

-- FORMA 2: armo una función que meta indiscriminadamente todos los elementos de las tuplas en una lista.
-- Luego le saco los repetidos a esa lista.
personas :: [(String, String)] -> [String]
personas [] = []
personas r = eliminarRepetidos (proyectarPersonas r)

proyectarPersonas :: [(String, String)] -> [String]
proyectarPersonas [] = []
proyectarPersonas ((a,b):xs) = a : b : proyectarPersonas xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs)
    | pertenece x xs = eliminarRepetidos xs
    | otherwise = x : eliminarRepetidos xs

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = e == x || pertenece e xs

-- Ejercicio 3
-- En cada tupla voy viendo si alguno de los dos elementos es la persona p de interes (estoy buscando los
-- amigos de la persona p), y si algunon de los dos es esa personas, agrego a la lista el otro elemento de esa tupla.
amigosDe :: String -> [(String, String)] -> [String]
amigosDe p [] = []
amigosDe p ((a,b):xs)
    | a == p = [b] ++ amigosDe p xs
    | b == p = a : amigosDe p xs
    | otherwise = amigosDe p xs

-- Ejercicio 4
-- Llamo a una función auxliar que aparte de la relaciones, reciba también la lista de personas de esa lista de relaciones.
-- Recorriendo esa lista de personas (esto lo va hacer esa función auxiliar), voy comprando de a dos, y quedandome con la
-- persona que tenga mayor cantidad de amigos.
personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos r = personaConMasAmigosAux r (personas r)

-- El algoritmo de esta funciópn auxiliar es practicamente el mismo que el del ejercicio 3.3 de la guia 5:
-- maximo, que hicimos en clase. Sólo que en lugar estar viendo si un numero es mayor que el otro, lo que hacemos es ver
-- si una persona tiene más amigos que otro, y según cual sea el que tenga mayor cantidad de amigo, voy a saber con cual
-- me sigo quedando, y cual puedo desechar de la lista, asi hasta que el unico que me va quedar en la lista va ser el maximo
-- de todos.
personaConMasAmigosAux :: [(String, String)] -> [String] -> String
personaConMasAmigosAux _ [p] = p
personaConMasAmigosAux r (p:q:ps)
    | longitud (amigosDe p r) > longitud (amigosDe q r) = personaConMasAmigosAux r (p:ps)
    | otherwise = personaConMasAmigosAux r (q:ps)

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- FORMA 2: Para no usar longitud, y amigosDe, directamente me puedo implementar una función
-- que me cuente la cantidad de amigos de una persona. Recibe el nombre de una persona (que este dentro de
-- relaciones, obviamente, para que no explote) y una lista de relaciones, y devuelve un entero. Es decir:
-- cantidadDeAmigos :: String -> [(String, String)] -> Integer
-- (Implementenla ustedes)

-- NOTA: La implementación de maximo (Ejercicio 3.3 guia 5) que vimos en clase fue esta:
-- maximo :: [Integer] -> Integer
-- maximo [x] = x
-- maximo (x:y:xs) | x > y = maximo (x:xs)
--                 | otherwise = maximo (y:xs)
-- 

-- Ejercicios extra para practicar:
-- cantidadApariciones :: Integer -> [Integer] -> Integer
-- Que me devuelva la cantidad de veces que aparece un numero entero n dentro de una lista de numeros
-- enteros.
-- Luego prueben hacer los mismo pero ahora en lugar de una lista de enteros, una lista de tuplas de enteros.
-- cantidadAparicionesTuplas :: Integer -> [(Integer, Integer)] -> Integer
