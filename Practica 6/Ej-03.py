#Ejercicio 3 
#a)

def alguno_es_0(num1 : float , num2 : float) -> bool:
    Res: bool = (num1 == 0) or (num2 == 0)
    return Res

num1: int = int(input("ingrese num1 "))
num2: int = int(input("ingrese num2 "))
print(alguno_es_0(num1,num2))
    
#b)

def ambos_son_0(num1 : float , num2 : float) -> bool:
    res: bool = (num1 == 0) and (num2 == 0)
    return res 

num1: int = int(input("ingrese num1 "))
num2: int = int(input("ingrese num2 "))
print(ambos_son_0(num1, num2))
print()

#c)

def problema_nombre_largo(nombre : str) -> bool:
    res: bool = len(nombre) >= 3 and len(nombre) <= 8 
    return res

nombre: str = (input(" "))
print(problema_nombre_largo(nombre)) 
print()

#d)

def bisiesto(año : int) -> bool:
    res: bool = (es_multiplo(año, 400)) or (es_multiplo(año,4)) and (not(es_multiplo(año, 100)))
    return res

def es_multiplo(año: int , n: int) -> bool:
    res: bool = (año % n == 0) 
    return res
    
año: int = int(input("el año es "))
print(bisiesto(año))
