--Ejercicio 6. Programar una funci´on bisiesto :: Integer ->Bool seg´un la siguiente especificaci´on:
--problema bisiesto (a˜no: Z) : Bool {
--requiere: {T rue}
--asegura: {res = f alse ↔ a˜no no es m´ultiplo de 4 o a˜no es m´ultiplo de 100 pero no de 400}

--Por ejemplo:
--bisiesto 1901 ⇝ False, bisiesto 1904 ⇝ True,
--bisiesto 1900 ⇝ False, bisiesto 2000 ⇝ True.

bisiesto :: Int -> Bool
bisiesto n| not (esMultiplo n 4) || esMultiplo n 100 && not (esMultiplo n 400) = False
          | otherwise = True

esMultiplo :: Int -> Int -> Bool
esMultiplo x y = mod x y == 0
