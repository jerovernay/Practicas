from queue import Queue as Cola


def cantidad_elementos(cola : Cola) ->int :
    c: int = 0

    while not cola.empty():
        c += 1
        cola.get()

    return c

cola = Cola()
cola.put(1)
cola.put(2)
cola.put(3)
cola.put(4)

print(cantidad_elementos(cola)) #4