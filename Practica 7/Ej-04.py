#1)
def pertenece(s:list, n: int) -> bool:
    for i in range(len(s)):
        if s[i] == n:
            return True
    return False


def estudiantes() -> list:
    lista: list = []
    nombre: str = input("")
    while nombre != "listo":
        if not pertenece(lista, nombre):
            lista.append(nombre)
        nombre: str = input("")
    return lista

#print(estudiantes())

#2)

def historialSUBE() -> list:
    historial: list = []
    Movimiento: str = input("Que quiere realizar: ")
    carga: str = input("Cuanto desea utilizar: ")
    while Movimiento != "X" :
        if Movimiento == "C":
            historial.append((Movimiento, carga))
        elif Movimiento == "D":
            historial.append((Movimiento, carga))
        Movimiento: str = input("Que quiere realizar: ")
        carga: str = input("Cuanto desea utilizar: ")
    return historial

print(historialSUBE())
