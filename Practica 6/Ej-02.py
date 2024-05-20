import math

#Ej 1

def imprimir_saludo(nombre:str):
    print ("Hola", nombre)

imprimir_saludo("pedro")

#Ej 2

def raiz_cuadrada_de(numero: float) -> float:
    x : float = numero
    y : float = 0.5
    return round(x ** y, 3)
    print(raiz_cuadrada_de(t))

raiz_cuadrada_de(60)

#Ej 3

def fahrenheit_a_celsius(t: float) -> float:
    return (((t-32)*5)/9)
    

print (fahrenheit_a_celsius(60))
print()

#Ej 4

def imprimir_dos_veces(estribillo :str):
    print (estribillo * 2)

imprimir_dos_veces("hola perdida ")

#Ej 5

def es_multiplo(n : int , m : int) -> bool:
    if (m % n == 0):
        return True
    else:
        return False
    
n: int = int(input("ingrese a "))
m: int = int(input("ingrese b "))
print(es_multiplo(n,m)) """

#Ej 6 

def es_par(numero: int) -> bool:
    if (es_multiplo(2,numero)):
        return True
    else:
        return False
    
numero: int = int(input("ingrese su numero "))
print(es_par(numero))

#Ej 7

def cantidad_de_pizzas(comensales: int , porciones_minimas: int) -> int:
    porciones_totales: int = comensales * porciones_minimas
    pizzas_necesarias: float = porciones_totales / 8

    if (pizzas_necesarias % 1 == 0):
        return (porciones_totales // 8)
    else: 
        return (porciones_totales // 8) + 1

print(cantidad_de_pizzas(9,2))
