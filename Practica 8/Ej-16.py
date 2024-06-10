from queue import Queue as Cola
import random 

#def imprimir_Cola(c):
#    while not c.empty():
#        elem: int = c.get()
#        print(elem)


def armar_secuencia_de_bingo() -> Cola[int]:
    secuencia = Cola()
    bolillero: list[int] = list(range(100))    

    for i in range(len(bolillero)):
        bolillero.append(i)

    random.shuffle(bolillero)
    
    for b in bolillero: 
        secuencia.put(b)

    print(bolillero)
    
    return secuencia

#imprimir_Cola(armar_secuencia_de_bingo())

def lista_Vacia(carton: list[int]) -> bool:
    
    if carton == []:
        return True
    
    return False

def jugar_carton_de_bingo(carton : list[int], bolillero : Cola[int]) -> int:
    contador: int = 0

    while not bolillero.empty() and not lista_Vacia(carton):
        num = bolillero.get()
        
        if num in carton:
            carton.remove(num)

        contador += 1

    return contador

carton: list[int] = [1,2,3,4,5,6,7,8,9,10,11,12]
carton1: list[int] = [2,4,6,8,10,12,14,16,18,20,22,24]

print(jugar_carton_de_bingo(carton, armar_secuencia_de_bingo()))
print(jugar_carton_de_bingo(carton1, armar_secuencia_de_bingo()))
