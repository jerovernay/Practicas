longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--Ejercicio 4. a) Definir las siguientes funciones sobre listas de caracteres, interpretando una palabra como una secuencia de caracteres sin blancos:

-- a) sacarBlancosRepetidos :: [Char] -> [Char], que reemplaza cada subsecuencia de blancos contiguos de la primera lista por un solo blanco en la lista resultado.

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = [] 
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:xs)| x == head xs && x == ' ' = sacarBlancosRepetidos xs
                            | otherwise = x : sacarBlancosRepetidos xs

-- b) contarPalabras :: [Char] -> Integer, que dada una lista de caracteres devuelve la cantidad de palabras que tiene. 

contarPalabras :: [Char] -> Integer
contarPalabras l1 = contarPalabrasAux(sacarBlancosRepetidos(sacarPrimerBlanco l1))

contarPalabrasAux ::[Char] -> Integer
contarPalabrasAux [] = 0
contarPalabrasAux [x] = 1
contarPalabrasAux (x:xs) 
                        | x == ' ' = 1 + contarPalabrasAux xs 
                        | otherwise = contarPalabrasAux xs

sacarPrimerBlanco :: [Char] -> [Char]
sacarPrimerBlanco [] = []
sacarPrimerBlanco [x] = [x]
sacarPrimerBlanco (x:xs) | x == ' ' = xs
                         | otherwise = x:xs

-- c) palabras :: [Char] -> [[Char]], que dada una lista arma una nueva lista con las palabras de la lista original

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (x:xs) = palabrasAux(sacarBlancosRepetidos (x:xs)) []

palabrasAux :: [Char] -> [Char] -> [[Char]]
palabrasAux [] [] = []
palabrasAux [] algo = [algo]                        -- me queda el primer blanco dentro de la lista, incluso usando funcion
palabrasAux (x:xs) algo  
    | x /= ' ' = palabrasAux xs (algo ++ [x])
    | otherwise = [algo] ++ palabrasAux xs []

-- d) palabraMasLarga :: [Char] -> [Char], que dada una lista de caracteres devuelve su palabra m´as larga.

comparacionLongitud :: [Char] -> [Char] -> [Char]
comparacionLongitud w1 w2 
    | longitud w1 >= longitud w2 = w1
    | otherwise = w2

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga l1 = palabraMasLargaAux (palabras l1)

palabraMasLargaAux :: [[Char]] -> [Char]
palabraMasLargaAux [] = []
palabraMasLargaAux [algo] = algo
palabraMasLargaAux (x:xs) = comparacionLongitud x (palabraMasLargaAux xs)

-- e) aplanar :: [[Char]] -> [Char], que a partir de una lista de palabras arma una lista de caracteres concaten´andolas.

aplanar :: [[Char]] -> [Char]
aplanar [] = []                     -- puede llegar a ser " " 
aplanar [texto] = texto
aplanar (x:xs) =  x ++ aplanar xs

-- f)  aplanarConBlancos :: [[Char]] -> [Char], que a partir de una lista de palabras, arma una lista de caracteres concatenandolas e insertando un blanco entre cada palabra

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs

-- g) aplanarConNBlancos :: [[Char]] -> Integer -> [Char], que a partir de una lista de palabras y un entero n, arma una lista de caracteres concaten´andolas e insertando n blancos entre cada palabra (n debe ser no negativo)


