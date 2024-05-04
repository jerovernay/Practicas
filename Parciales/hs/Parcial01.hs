{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use :" #-}
{-# HLINT ignore "Use foldr" #-}
module Otro where
e
{- 1) Atajaron Suplentes
problema atajaronSuplentes (arquerosPorEquipo: seq<String X String>, goles: seq<Z>, totalGolesTorneo: Z): Z {
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
	asegura: {
	res es la cantidad de goles recibidos en el torneo por arqueros que no son titulares en sus equipos. -} 

division :: Integer -> Integer -> Float
division a b = fromIntegral a / fromIntegral b

atajaronSuplentes :: [(String,String)] -> [Integer] -> Integer -> Integer
atajaronSuplentes equipos golesTitu golesTotal = golesTotal - atajaronTitulares golesTitu

atajaronTitulares :: [Integer] -> Integer
atajaronTitulares [] = 0
atajaronTitulares [x] = x
atajaronTitulares (x:y:xs) = atajaronTitulares (x+y:xs)

{- 2) Equipos Válidos
problema equiposValidos (arquerosPorEquipo: seq<String X String>): Bool {
	requiere: {True}
	asegura: {
	(res = True) <=> arquerosPorEquipo no contiene nombres de clubes repetidos, ni arqueros repetidos, ni jugadores con nombre del club -}

equiposValidos :: [(String, String)] -> Bool
equiposValidos [] = False
equiposValidos ((a,b):xs) 
    | (a /= b) && mismoNombre a xs && equiposValidos xs = True
    | otherwise = False

mismoNombre :: String -> [(String, String)] -> Bool
mismoNombre _ [] = False
mismoNombre x ((p,v):ps) = x == p || x == v || mismoNombre x ps

{- 3) Porcentaje de goles
problema porcentajeDeGoles (arquero: String, arquerosPorEquipo: seq<String X String>, goles: seq<Z>): R {
	requiere: {La segunda componente de algún elemento de arquerosPorEquipo es arquero}
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
	asegura: {
	res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares -}

porcentajeDeGoles :: String -> [(String, String)] -> [Integer] -> Float
