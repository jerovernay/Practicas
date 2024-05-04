module Hoy where

{-
En Exactas se está jugando un torneo de fútbol y la facultad le pidió a los alumnos de IP programar algunas funcionalidades en Haskell. 
Los datos con los que contamos para esto son los nombres de los equipos que participan del torneo, los nombres de los goleadores de cada uno de dichos equipos, y la cantidad de goles convertidos por esos jugadores. 
Los nombres de los equipos y sus respectivos goleadores serán modelados mediante tuplas de tipo (String, String), donde la primera componente representa el nombre del equipo, y la segunda representa el nombre del goleador de dicho equipo.
En los problemas en los cuales se reciban como parámetros secuencias goleadoresPorEquipo y goles, cada posición de la lista goles representará la cantidad de goles obtenidos por el goleador del equipo que se encuentra en en esa misma posición de goleadoresPorEquipo. 
Por ejemplo, si la lista goleadoresPorEquipo es [("Sacachispas","Robertino Giacomini"), ("Fénix","Matías Domínguez")] y la lista goles es [3, 5], eso indica que Robertino Giacomini metió 3 goles, y Matías Domínguez 5. -}


{- Goles de no goleadores [1 punto]
problema golesDeNoGoleadores (goleadoresPorEquipo: seq⟨String x String⟩,goles:seq< Z >, totalGolesTorneo: Z) : Z {
  requiere: {equiposValidos(goleadoresPorEquipo)}
  requiere: {|goleadoresPorEquipo| = |goles|}
  requiere: {Todos los elementos de goles son mayores o iguales a 0}
  requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
  asegura: {res es la cantidad de goles convertidos en el torneo por jugadores que no son los goleadores de sus equipos} -}


golesDeNoGoleadores :: [(String,String)] -> [Integer] -> Integer -> Integer
golesDeNoGoleadores [] [] 0 = 0
golesDeNoGoleadores equiYJuga golesGole goles = goles - golesDeGoleadores golesGole

golesDeGoleadores :: [Integer] -> Integer
golesDeGoleadores [] = 0 
golesDeGoleadores [x] = x
golesDeGoleadores (x:y:xs) = golesDeGoleadores (x+y:xs)


{- 2) Equipos Válidos [3 puntos]
problema equiposValidos (goleadoresPorEquipo: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> goleadoresPorEquipo no contiene nombres de clubes repetidos, ni goleadores repetidos, 
  ni jugadores con nombre de club}
 -}


equiposValidos :: [(String, String)] -> Bool
equiposValidos [] = True
equiposValidos [(a,b)] = True
equiposValidos ((a,b):xs)
  | pertenece (a,b) xs = False
  | pertenece (b,a) xs = False
  | aparece a xs = False
  | aparece b xs = False
  | otherwise = equiposValidos xs

aparece :: String -> [(String,String)] -> Bool
aparece n [] = False
aparece n ((a,b):xs)
  | n == a = True
  | n == b = True
  | otherwise = aparece a xs

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs)
  | n == x = True
  | otherwise = pertenece n xs 


{- 3) Porcentaje de Goles [3 puntos]
problema porcentajeDeGoles (goleador: String, goleadoresPorEquipo: seq⟨String x String⟩,goles:seq< Z >) : R {
  requiere: {La segunda componente de algún elemento de goleadoresPorEquipo es goleador}
  requiere: {equiposValidos(goleadoresPorEquipo)}
  requiere: {|goleadoresPorEquipo| = |goles|}
  requiere: {Todos los elementos de goles son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de goles mayores estricto a 0}
  asegura: {res es el porcentaje de goles que marcó goleador sobre el total de goles convertidos por goleadores} -}

division :: Integer -> Integer -> Float
division a b = fromIntegral a / fromIntegral b

porcentajeDeGoles :: String -> [(String, String)] -> [Integer] -> Float
porcentajeDeGoles jug equipos golesGole = division (golesGoleador jug equipos golesGole) (golesDeGoleadores golesGole) * 100

golesGoleador :: String -> [(String, String)] -> [Integer] -> Integer
golesGoleador jug ((a,b):xs) (p:ps)
  | jug == b = p 
  | otherwise = golesGoleador jug xs ps


{- 4) Botín de Oro [3 puntos]
problema botinDeOro (goleadoresPorEquipo: seq⟨String x String⟩, goles:seq< Z >) : String {
  requiere: {equiposValidos(goleadoresPorEquipo)}
  requiere: {|goleadoresPorEquipo| = |goles|}
  requiere: {Todos los elementos de goles son mayores o iguales a 0}
  requiere: {|goles| > 0}
  asegura: {res es alguno de los goleadores de goleadoresPorEquipo que más tantos convirtió de acuerdo a goles} -}

botinDeOro :: [(String,String)] -> [Integer] -> String 
botinDeOro eqYGole golesGole = botinDeOroAux eqYGole golesGole (maximo golesGole)

botinDeOroAux :: [(String,String)] -> [Integer] -> Integer -> String
botinDeOroAux [] [] 0 = "ninguno"
botinDeOroAux ((a,b):xs) (p:ps) max
  | p == maximo (p:ps) = b
  | otherwise = botinDeOroAux xs ps max

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs)
  | x >= y = maximo (x:xs)
  | otherwise = maximo (y:xs)
