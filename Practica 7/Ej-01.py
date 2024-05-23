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

print(suma_total(seq1))
print(suma_total(seq2))