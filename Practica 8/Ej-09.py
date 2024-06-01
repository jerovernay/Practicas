from queue import LifoQueue as Pila 

def cantidad_elementos(pila: Pila) -> int:
    pilaNueva = Pila()
    c: int = 0

    while not pila.empty():
        elem = pila.get()
        pilaNueva.put(elem)
        c += 1

    while not pilaNueva.empty():
        pila.put(pilaNueva.get())

    return c

p1 = Pila()
p1.put(1)
p1.put(2)
p1.put(3)
p1.put(4)


print(cantidad_elementos(p1)) #4