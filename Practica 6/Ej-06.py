#1)
def del_1al_10():
    num = 1
    while num <= 10:
        print(num)
        num += 1

#del_1al_10()

#2)

def pares_de_10_al_40():
    num = 10
    while num <= 40:
        print(num)
        num += 2

#pares_de_10_al_40()

#3)

def eco_10_times():
    contador = 1
    while contador <= 10:
        print("eco")
        contador += 1

#eco_10_times()

#4)

def despegue(num):
    while num > 0:
        print(num)
        num -= 1
    print("Despegue")

#despegue(10)

#5)

def time_travel(partida, llegada):
    partida -= 1
    while partida  > llegada:
        print("Viaje un año al pasado, estamos en el año: " + str(partida))
        partida -= 1
    print("Llegamos a: " + str(llegada))

#time_travel(2000, 1990)

#6)

def time_travel_aristoteles(partida, llegada):
    partida -= 20
    while partida > (-384):
        print("Viaje 20 años al pasado, estamos en el año: " + str(partida))
        partida -= 20
    print("Que onda Aristoles")

time_travel_aristoteles(1000, (-400))