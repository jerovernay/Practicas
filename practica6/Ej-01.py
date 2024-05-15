import math

#Ej1
def imprimir_hola_mundo():
    print("Hola Mundo")

imprimir_hola_mundo()
print()

#Ej 2

def imprimir_un_verso():
    print("Hello,\nits me")

imprimir_un_verso()

#Ej 3

def raiz_de_2() -> float:
    x : float = 2
    exp : float = 0.5
    return round(x**exp , 4)

print (raiz_de_2())

#Ej 4

def factorial_de_dos() -> int :
    x : int = 2
    y : int = 1
    return (x * y)

print(factorial_de_dos())

#Ej 5

def perimetro() -> float:
    x : float = 2
    return ( x * math.pi)

print(perimetro())
