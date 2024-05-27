import math 

#1)

def pertenece(s: list, e: int ) -> bool:
    if s.count(e) >= 1:
        return True
    else: 
        return False
    
#print(pertenece([1,2,3], 2))

def pertenece1(s:list ,e:int) -> bool:
    for i in range(0, len(s), 1):
        if (s[i] == e):
            return True
    return False

#print(pertenece1([1,2,3],2))

#2)

seq1: list = [1,2,3,4]
seq2: list = [2,4,6,8,10]


def divide_a_todos(s:list, e:int) -> bool:
    i:int = 0
    res: bool = True
    while ((i < len(s)) and (res == True)):
        if (s[i] % e != 0):
            return False
        i += 1
    return res

#print(divide_a_todos(seq2, 3))

#3)

seq1: list = [1,2,3,4,5,6]
seq2: list = [2,4,6,7,8,9,10]

def suma_total(s: list) -> int:
    res: int = 0
    for i in range(0, len(s), 1):
            res += s[i]
    return res

#print(suma_total(seq1))
#print(suma_total(seq2))

#4)


def ordenados(s: list) -> bool:
    rs: bool = True
    i: int = 0
    while ((i < len(s) - 1) & (rs == True)):
        if (s[i] > s[i+1]):
            rs = False
        i += 1
    return rs

#print(ordenados(seq1))

#5)

seq3 = ["Hola", "Excelente", "Excelente"]

def es_mayor_a_7(l: list) -> bool:
    res: bool = False
    for i in range(0, len(l), 1):
        if(len(l[i]) > 7):
            res = True
            break
    return res                                      # ENTENDER QUE NUNCA PERO NUNCA SE DEJA EN EL MISMO QUE EL "IF", PEDAZO DE ESTUPIDO.

#print(es_mayor_a_7(seq3))

#6)

def es_palindromo(p: str) -> bool:          #ana anita lava la tina
    res: bool = True
    i: int = 0
    while i < len(p):
        if p[i] != p[len(p) -1 - i]:
            res = False
        i += 1
    return res

#p: str = input("palabra: ")
#print(es_palindromo(p))

#7)


#7)

def hay_Minus(c:str) -> bool:
    res: bool = False
    for char in c:
        if ("a" <= char) and (char <= "z"):
            res = True
    return res

def hay_Mayus(c: str) -> bool:
    res: bool = False
    for char in c:
        if ("A" <= char) and (char <= "Z"):
            res = True
    return res

def hay_Num(c: str) -> bool:                    #chequea existencia
    res: bool = False
    for char in c:
        if ("0" <= char) and (char <= "9"):
            res = True
    return res    

def esVerde(c:str) -> bool:
    if len(c) > 8:
        if (hay_Minus(c)):
            if (hay_Mayus(c)):
                if (hay_Num(c)):
                    return True
    return False

def esRojo(c: str) -> bool:
    if len(c) < 5:
        return True
    return False
    
def seguridad(c:str) -> str:
    if esVerde(c):
        return "Verde"
    elif esRojo(c):
        return "Roja"
    else:
        return "Amarilla"

print(seguridad("Brasil5281")) 

#8) 

def saldoTotal(m: list) -> int:
    saldo: int = 0
    for movimiento in m:
        if movimiento[0] == "I":
            saldo += movimiento[1]
        elif movimiento[0] == "R":
            saldo -= movimiento[1]
    return saldo

#print(saldoTotal([("I", 2000), ("R", 20), ("R", 1000), ("I", 300)]))

#9)

def esVocal(char: str) -> bool:
    vocales: list = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    if pertenece(vocales, char):
        return True
    return False

def cantVocales3(palabra: str) -> bool:
    cantVocales: int = 0
    for char in palabra:
        if esVocal(char):
            cantVocales += 1
    if cantVocales >= 3:
        return True
    else:
        return False
    
print(cantVocales3("Bueno"))
print(cantVocales3("Malo"))
