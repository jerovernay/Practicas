#1)

def modificarLista_INOUT(l: list):
    for elemento in range(len(l)):
        if  (elemento % 2 == 0):
            l[elemento] = 0

""" lista: list = [1,2,3,4,5,6]
modificarLista_INOUT(lista)
print(lista)
 """
#2)

def modificarLista_IN(lista: list) -> list:
    copiaDeLista: list = lista.copy()
    for elemento in range(len(copiaDeLista)):
        if (elemento % 2 == 0):
            copiaDeLista[elemento] = 0
    return copiaDeLista

""" lista2: list = [7,8,9,10,11,12,13] 
print(modificarLista_IN(lista2))
print(lista2)
 """
#3)

def pertenece(s: list, e: int ) -> bool:
    if s.count(e) >= 1:
        return True
    else: 
        return False

def esVocal(char: str) -> bool:
    vocales: list = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    if pertenece(vocales, char):
        return True
    return False

def sinVocales(palabra: str) -> str:
    for letra in palabra:
        if esVocal(letra):
            palabra.remove(letra)
    return palabra


#sinVocales("Buenas")        #Porque??

#4)

def reemplaza_vocales(palabra: list) -> list:
    palabra1: list = palabra.copy()
    for letra in range(len(palabra1)):
        if esVocal(palabra1[letra]):
            palabra1[letra] = ' '
    return palabra1

p: list = ["B", "u", "e","n", "a", "s"]
print(reemplaza_vocales(p))

#5)

def daVueltaStr(palabra: list) -> list:
    p1: list = palabra.copy()
    for i in range(len(p1)):
        p1[i] = palabra[len(palabra) - 1 - i]
    return p1

print(daVueltaStr(p))

#6)

