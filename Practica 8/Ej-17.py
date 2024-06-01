from queue import Queue as Cola

#separo en 3 areas medicas tal que hay n cantidad de pacientes urgentes en el rango de 3 especialidades

# 1ro = Pediatria , 2do = Clinica , 3ro = Traumatologia
# No termino siendo de utilidad, pero pq es mas facil el ejercicio en gral

def n_pacientes_urgentes(c : Cola[(int, str, str)]) -> int:
    urgencias: int = 0

    while not c.empty():
        paciente: tuple = c.get()
        prioridad, nombre, especialidad = paciente

        if 1 <= prioridad <= 3:
            urgencias += 1
    
    return urgencias

guardia = Cola()

guardia.put((1, "Juan", "Traumatologia"))
guardia.put((7, "Pedro", "Pediatria"))
guardia.put((2, "Maxi", "Clinica"))
guardia.put((5, "Jero", "Traumatologia"))
guardia.put((3, "Diego", "Traumatologia"))

print(n_pacientes_urgentes(guardia)) #3