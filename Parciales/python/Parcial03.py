#EJ 1

def verificar_transacciones() -> int:
    print("Bienvenido" + '\n')    
    saldo: int = 0
    movimiento: str = input("Que desea realizar: ")
    contador: int = 0 

    while movimiento != ('x' or 'X'):
        if saldo < 0:
            break
        if movimiento == 'r':
            saldo += 350
            contador += 1
        elif movimiento == 'v':
            saldo -= 56
            contador += 1
        elif movimiento == 's':
            print(saldo)
            contador += 1
        
        movimiento: str = input("Que desea realizar: ")
    
    if saldo < 0:
        return contador
    else:
        return saldo
    

#print(verificar_transacciones())

#Ej 2

def valor_minimo(reporte: list[(float, float)])-> float:
    min: float = 0

    for tupla in reporte:
        if tupla[0] < min:
            min = tupla[0]

    return min

s = [(1.0, 5.2), (10.4, 15.1), (19.7, 28.9), (25.4, 35.6), (-3.1, 1.3)]
t = [(-3.1, 17.3), (-3.2, 3.0), (-3.1, 3), (-3.2, 1.0), (-3.0, 3.0)]
#print(valor_minimo(s)) # -3.1
#print(valor_minimo(t)) # -3.2

#Ej 3

cotizaciones_diarias = {"YPF" : [(1,10),(15, 3), (31,100)], "ALUA" : [(1,0), (20, 50), (31,30)]}

def maximo(s: list[(int, float)]) -> float:
    max: float = 0

    for tupla in s:
        if tupla[1] > max:
            max = tupla[1]

    return max

def minimo(s: list[(int, float)]) -> float:
    min: float = 100000000000000000000000000000000000000000000000000000000000 #no hay valor existente que cotiza tanto en la bols

    for tupla in s:
        if tupla[1] < min:
            min = tupla[1]

    return min


def valores_extremos(diarias: dict[str, list[(int,float)]]) -> dict[str, (float, float)]:
    res = {}
    items = diarias.items()

    for empresa, cotizaciones in items:
        min = minimo(cotizaciones)
        max = maximo(cotizaciones)
        res[empresa] = (min, max)

    return res 
    
# print(valores_extremos(cotizaciones_diarias)) # {"YPF" : (3,100), "ALUA" : (0,50)}

#Ej 4

def cantApariciones(e: int, s: list[int]) -> int:
    contador: int = 0

    for num in s:
        if num == e:
            contador += 1

    return contador


def cantAparicionesEnPosicion(e: int, pos: int, m: list[list[int]]) -> int:
    contarPosicion: int = 0

    for fila in m:
        if fila[pos] == e:
            contarPosicion += 1

    return contarPosicion


def es_sudoku_valido(m: list[list[int]]) -> bool:
    res: bool = True
    
    for fila in m:
        for num in fila:
            if num != 0 and cantApariciones(num, fila) > 1:
                res = False

    for columnas in range(9):
        for num in range(1,9):
          if cantAparicionesEnPosicion(num, columnas, m) > 1:
              res = False
    
    return res

m = [
[1, 2, 3, 4, 5, 6, 7, 8, 9],
[9, 8, 7, 6, 4, 5, 3, 2, 1],
[0, 0, 0, 0, 0, 0, 1, 0, 0],
[0, 0, 0, 0, 0, 4, 0, 0, 0],
[0, 0, 0, 0, 6, 0, 0, 0, 0],
[0, 0, 0, 5, 0, 0, 0, 0, 0],
[0, 0, 4, 0, 0, 0, 0, 0, 0],
[0, 3, 0, 0, 0, 0, 0, 0, 0],
[2, 0, 0, 0, 0, 0, 0, 0, 0]
]

print(es_sudoku_valido(m))