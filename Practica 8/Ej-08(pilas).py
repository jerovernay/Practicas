from queue import LifoQueue as Pila 
import random


def generar_nros_al_azar(cantidad : int, desde : int, hasta : int) -> list[int]:
    p = Pila()

    for i in range(cantidad):
        num: int = random.randint(desde, hasta)
        p.put(num)

    return p
    

def printear_pila(p):
    while not p.empty():
        elem: int = p.get()
        print(elem)