#Ejercicio 5 

#a)
def devolver_el_doble_si_es_par(num: int):
    if (num % 2 == 0):
        return num * 2
    else:
        return num

#num: int = int(input("numero es "))
#print(devolver_el_doble_si_es_par(num))

#b)

def devolver_valor_si_es_par_sino_el_que_sigue(num):
    if (num % 2 == 0):
        return num * 2
    else:
        return (num + 1) * 2

#num: int = int(input("numero es "))
#print(devolver_valor_si_es_par_sino_el_que_sigue(num))

#c)

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(num):
    if (num % 3 == 0) and (not(num % 9 == 0)):
        return num * 2
    elif (num % 9 == 0):
        return num * 3
    else:
        return num
    
#num: int = int(input("numero es "))
#print(devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(num))

#d)

def lindo_nombre(nombre):
    if len(nombre) >= 5:
        return "Tu nombre tiene muchas letras"
    else:
        return "Tu nombre no tiene muchas letras"

#nombre: str = input("tu nombre es: ")
#print(lindo_nombre(nombre))

#e)

def elRango(num):
    if (num < 5):
        return "Menor a 5"
    elif (10 <= num <= 20):
        return "Esta entre 10 y 20"
    elif (num >= 20):
        return "Mayor a 20"
    else:
        return "Entre 5 y 9"
    
num: int = int(input("el numero es "))
print(elRango(num))

#f) 

def jubilaciones_festivas( sexo , edad ):
    if (edad >= 65):
        return "de vacas con los nietos"
    elif (edad <= 18):
        return "De vacas con los abues"
    elif sexo == 'F' and (edad < 60):
        return "Toca Laburar"
    else: 
        sexo == 'M' and (edad < 65) 
        return "Toca Laburar"
    
sexo: chr = input("Masculino o Femenino: ")
edad: int = int(input("Edad: "))
print(jubilaciones_festivas(sexo, edad))
