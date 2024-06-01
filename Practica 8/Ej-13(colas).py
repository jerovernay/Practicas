from queue import Queue as Cola
import random


def imprimir_Cola(c):
    while not c.empty():
        elem: int = c.get()
        print(elem)

def generar_nros_al_azar(cantidad : int, desde : int, hasta : int) -> list[int]:
    c = Cola()

    for i in range(cantidad):
        num: int = random.randint(desde, hasta)
        c.put(num)
    
    return c

imprimir_Cola(generar_nros_al_azar(5,1,1000))