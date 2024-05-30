from queue import LifoQueue as Pila 

p1 = Pila()
p1.put(5)
p1.put(1)
p1.put(3)
p1.put(20)
p1.put(10)

def buscar_el_maximo( p : Pila[int]) -> int:
    maximo: int = 0

    while not p.empty():
        elem = p.get()
        
        if elem >= maximo:
            maximo = elem
    
    return maximo

        


print(buscar_el_maximo(p1)) #20