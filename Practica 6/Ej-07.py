def eiou():
    for num in range(1,11, 1):
        print(num)

#eiou()

def pares_de_10_al_40():
    for num in range(10,41, 2):
        print(num)

#pares_de_10_al_40()

def eco_10_times():
    for num in range (1,11,1):
        print("eco")

#eco_10_times()

def despegue(num):
    for num in range(num, 0, (-1)):
        print(num)
    print("Despegue")

#despegue(15)

def time_travel(partida, llegada):
    for partida in range((partida-1), llegada, (-1)):
        print("Viaje un año al pasado, estamos en el año: " + str(partida))
    print("LLegamos al: " + str(llegada))

time_travel(2000, 1990)