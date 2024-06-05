#1

def pertenece(s: list, e:int) ->bool:
    for i in range(len(s)):
        if s[i] == e:
            return True
    return False

def pertenece_a_cada_uno_version_1(s: list[list[int]], e: int ) -> list[bool]:
    listaFinal: list[bool] = []
    
    for i in range(len(s)):
        if pertenece(s[i], e):
            listaFinal.append(True)
        else:
            listaFinal.append(False)

    return listaFinal

s = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
e = 5

print(pertenece_a_cada_uno_version_1(s,e)) # [False, True, False]
print()

#2

def es_matriz(s: list[list[int]]) -> bool:

    if len(s) == 0:
        return False
    
    if (len(s[0]) == 0):
        return False
    

    for i in range(len(s)):
        if len(s[i]) != len(s[0]):
            return False
        
    return True

s1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
s2 = [[1, 2], [3, 4, 5], [6, 7]]
s3 = []
s4 = [[1, 2, 3], [], [7, 8, 9]]

print(es_matriz(s1))  # True
print(es_matriz(s2))  # False
print(es_matriz(s3))  # False
print(es_matriz(s4))  # False
print()

#3
def ordenados(s : list[int]) -> bool:
    res: bool = True

    for i in range(1, len(s)):
        if s[i-1] > s[i]:
            res = False
    
    return res

#s = [1,2,3,4]
#f = [2,4,1,4]
#print(ordenados(s))
#print(ordenados(f))

def filas_ordenadas(m : list[list[int]]) -> list[bool]:
    listaBools: list[bool] = []

    for i in range(len(m)):
        if ordenados(m[i]):
            listaBools.append(True)
        else:
            listaBools.append(False)

    return listaBools


m1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] # [ True, True, True]
m2 = [[1,2,3], [4,3,2], [5,6,7]]     # [True, False, True]
m3 = [[1,3], [2,3], [4,3], [3,2]]    # [True, True, False, False]

print(filas_ordenadas(m1))
print(filas_ordenadas(m2))
print(filas_ordenadas(m3))