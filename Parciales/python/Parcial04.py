from queue import Queue as Cola

#Ej 1 - Fila ExactBank

def cola_priorizando_vips(filaClientes: Cola[str, str]) -> Cola[str]:
    colaComun = Cola()
    colaVip = Cola()

    while not filaClientes.empty():
        cliente = filaClientes.get()
        nombre, preferencia = cliente

        if preferencia == "vip":
            colaVip.put(nombre)
        elif preferencia == "comun":
            colaComun.put(nombre)

    colaFinal = Cola()
    while not colaVip.empty():
        vip = colaVip.get()
        colaFinal.put(vip)
    while not colaComun.empty():
        comun = colaComun.get()
        colaFinal.put(comun)

    return colaFinal

def imprimirCola(c):    
    while not c.empty():
        elem = c.get()
        print(elem)

ejemplo = Cola()
ejemplo.put(("Jorge", "comun")) #3
ejemplo.put(("Javier", "vip")) #1
ejemplo.put(("Jeronimo", "comun")) #4
ejemplo.put(("Julian", "comun")) #5
ejemplo.put(("Juan", "vip")) #2

#imprimirCola(cola_priorizando_vips(ejemplo))    

#Ej 2 - Chicken Game

estrategias = {'Juan' : "me desvio" , 'Jorge' : "me desvio", 'Julian' : "me la banco"}

def torneo_de_gallinas(estrategias: dict[str, str]) -> dict[str,int]:
    puntajes = {}
    jugadores = estrategias.keys()

    for jugador in jugadores:
        if jugador not in puntajes:
            puntajes[jugador] = 0               # arranco en 0 todos los jugadores

    listadoGral = estrategias.items()

    for jugador, estrategia in listadoGral:     # itero cada una de los valores, al principio agarro el mismo, pero aclaro que solo suma si no es el mismo. De ahi voy comparando desde el que esta en posicion con todo el resto de jugadores
        for jugador2, estrategia2 in listadoGral:
            if jugador != jugador2:
                if estrategia == "me desvio" and estrategia2 == "me desvio":
                    puntajes[jugador] -= 10
                elif estrategia == "me desvio" and estrategia2 == "me la banco":
                    puntajes[jugador] -= 15
                elif estrategia == "me la banco" and estrategia2 == "me desvio":
                    puntajes[jugador] += 10
                elif estrategia == "me la banco" and estrategia2 == "me la banco":
                    puntajes[jugador] -= 5

    return puntajes

#print(torneo_de_gallinas(estrategias))

#Ej 3 - ta te ti facilito

tableroImpar = [        #gana ana
['x', 'o', 'o', 'o', 'x'],
['x', 'x', 'o', 'x', 'o'],
['x', 'o', 'x', 'o', 'x'],
['o', 'x', 'o', 'x', 'o'],
['x', 'o', 'x', 'o', 'x']
]

tableroPar = [ # trampa
['o', 'x', 'o', 'x', 'o', 'x'],    
['x', 'o', 'x', 'o', 'x', 'o'],
['o', 'x', 'o', 'x', 'o', 'x'],
['x', 'o', 'x', 'o', 'x', 'o'],
['x', 'o', 'o', 'x', 'o', 'x'],
['x', 'o', 'x', 'o', 'x', 'o']
]




def quien_gano_el_tateti_facilito(tablero: list[list[str]]) -> int:
    n = len(tablero)
    hay_tres_x: bool = False #seteo ambos en falso como caso base
    hay_tres_o: bool = False
    res: int = 0 # este resultado termina variando o quedando igual

    for columna in range(n):
        contadorX: int = 0
        contadorO: int = 0

        for fila in range(n):
            if tablero[fila][columna] == 'x':
                contadorX += 1
                contadorO = 0       #reinicio a cero cada que no sea el elemento seguido esperado
            elif tablero[fila][columna] == 'o':
                contadorX = 0
                contadorO += 1
            else:
                contadorX = 0
                contadorO = 0
            
            if contadorX == 3:          # dentro del for de la fila analizo si aparece tres veces consecutivas
                hay_tres_x = True       # si aparece = True
            elif contadorO == 3:
                hay_tres_o = True
    
    if hay_tres_x and hay_tres_o:
        res = 3
    elif hay_tres_x:
        res = 1
    elif hay_tres_o:
        res = 2
    else:
        res = 0

    return res

""" print(quien_gano_el_tateti_facilito(tableroImpar)) #1
print(quien_gano_el_tateti_facilito(tableroPar)) #3 """

#Ej 4 - sufijos y palindromos

def es_palindromo(palabra: str) -> bool:

    for i in range(len(palabra)):
        if palabra[i] != palabra[len(palabra) -i - 1]:
            return False
    
    return True

def cuantos_sufijos_son_palindromos(texto : str) -> int:
    contador: int = 0    

    while len(texto) > 0:
        if es_palindromo(texto):
            contador += 1
        texto = texto[1:]           #recordar siempre en los while loops, que al cambiar algo, siempre hay que reasignarlo

    return contador

print(cuantos_sufijos_son_palindromos("persana")) #2
print(cuantos_sufijos_son_palindromos("anana")) #3

