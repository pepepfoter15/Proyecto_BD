from FuncionesMariaDB import *

db = conectar_BD("localhost","pepe","root","pythonbbdd")
opcionelegida = menu()

while opcionelegida != 7:

    if opcionelegida == 1:
        opcion1(db)
    
    elif opcionelegida == 2:
        opcion2(db)

    elif opcionelegida == 3:
        opcion3(db)

    elif opcionelegida == 4:
        opcion4(db)

    elif opcionelegida == 5:
        opcion5(db)

    elif opcionelegida == 6:
        opcion6(db)

if opcionelegida == 7:
    desconectar_BD(db)