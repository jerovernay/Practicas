from queue import Queue as Cola

c = Cola()
c.put(23)
c.put(34)
c.put(77)
c.put(5)

c1 = Cola()
c1.put(93)
c1.put(5)
c1.put(93)
c1.put(51)

def buscar_el_maximo( c : Cola[int]) -> int:
    maximo: int = 0

    while not c.empty():
        elem = c.get()

        if elem >= maximo:
            maximo = elem

    return maximo 

print(buscar_el_maximo(c)) #77
print(buscar_el_maximo(c1)) #93