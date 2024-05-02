module Hoy where

{- En los problemas en los cuales se reciban como parámetro secuencias de fórmulas y votos, cada posición de la lista votos
representará la cantidad de votos obtenidos por la fórmula del parámetro formulas en esa misma posición. Por ejemplo, si la lista de fórmulas es [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] y 
la lista de votos fuera [34, 56], eso indicaría que la fórmula encabezada por María Montero obtuvo 56 votos, y la lista encabezada por Juan Pérez obtuvo 34 votos. -}

{- 1) Porcentaje de Votos Afirmativos [1 punto]
problema porcentajeDeVotosAfirmativos (formulas: seq⟨String x String⟩,votos:seq< Z >, cantTotalVotos: Z) : R {
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos}
 asegura: {res es el porcentaje de votos no blancos (es decir, asociados a alguna de las fórmulas) sobre el total de votos emitidos}
}
Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int: -}

division :: Integer -> Integer -> Float
division a b = (fromIntegral a) / (fromIntegral b)

porcentajeDeVotosAfirmativos :: [(String, String)] -> [Integer] -> Integer -> Float
porcentajeDeVotosAfirmativos [] [] 0 = 0
porcentajeDeVotosAfirmativos l1 votos votosTotales = division (votoAfirmativo votos) votosTotales * 100

votoAfirmativo :: [Integer] -> Integer
votoAfirmativo [] = 0
votoAfirmativo [x] = x
votoAfirmativo (x:y:xs) = votoAfirmativo (x+y:xs)


{- 2) Formulas Inválidas [3 puntos]
problema formulasInvalidas (formulas: seq⟨String x String⟩) : Bool {        
requiere: {True}
asegura: {(res = true) <=> formulas contiene un candidato se propone para presidente y vicepresidente en la misma fórmula;
o algún candidato se postula para presidente o vice en más de una fórmula } -}

formulaInvalida :: [(String,String)] -> Bool
formulaInvalida [] = True
formulaInvalida ((a,b):xs) 
  | (a /= b) && noRepite (a,b) xs && formulaInvalida xs = False
  | otherwise = True


noRepite :: (String, String) -> [(String, String)] -> Bool
noRepite (a,b) [] = True
noRepite (a,b) (x:xs) = (a,b) /= x && (b,a) /= x  && noRepite x xs

{- 3) Porcentaje de Votos [3 puntos]
problema porcentajeDeVotos (vice: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R {
 requiere: {La segunda componente de algún elemento de formulas es vice}
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {Hay al menos un elemento de votos mayores estricto a 0}
 asegura: {res es el porcentaje de votos que obtuvo vice sobre el total de votos afirmativos}
}
Para resolver este ejercicio pueden utilizar la función division presentada en el Ejercicio 1. -}

porcentajeDeVotos :: String -> [(String, String)] -> [Integer] -> Float
porcentajeDeVotos vice formulas votos = division (aparicionesViceEnFormula vice formulas votos) (votoAfirmativo votos) * 100

aparicionesViceEnFormula :: String -> [(String,String)] -> [Integer] -> Integer
aparicionesViceEnFormula _ [] [] = 0
aparicionesViceEnFormula vice ((a,b):xs) (p:ps)
  | vice == b = p
  | otherwise = aparicionesViceEnFormula vice xs ps


{- 4) Menos Votado [3 puntos]
problema menosVotado (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {Hay al menos un elemento de votos mayores estricto a 0}
 requiere: {|formulas| > 0}
 asegura: {res es el candidato a presidente de formulas menos votado de acuerdo a los votos contabilizados en votos}
-}

menosVotado :: [(String, String)] -> [Integer] -> String
menosVotado formula votos = menosVotadoAux formula votos (minimo votos)

menosVotadoAux :: [(String, String)] -> [Integer] -> Integer -> String
menosVotadoAux [] [] 0 = " "
menosVotadoAux ((a,b):xs) (p:ps) min
  | p == minimo (p:ps) = a
  | otherwise = menosVotadoAux xs ps min 


minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:y:xs)
  | x <=  y = minimo (x:xs)
  | otherwise = minimo (y:xs)
