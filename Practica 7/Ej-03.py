def promedio(notas: list) -> float:
    promiedo: float = 0
    for nota in notas:
        promiedo += nota
    
    return (promiedo // len(notas))

def algun_desaprobado(notas: list) -> bool:
    res: bool = False
    for nota in notas:
        if nota < 4:
            res = True
    return res

def aprobacion(notas: list) -> int:
    if promedio(notas) >= 7 and not algun_desaprobado(notas):
        return 1
    elif (4 <= promedio(notas) < 7) and not algun_desaprobado(notas):
        return 2
    elif algun_desaprobado(notas) or promedio < 4:
        return 3

n: list = [1,2,3,4] #3
n1: list = [10,8,9,7] #1
n2: list = [5,6,7,5] #2
n4: list = [10,9,9,3] #3
print(aprobacion(n))
print(aprobacion(n1))
print(aprobacion(n2))
print(aprobacion(n4))
