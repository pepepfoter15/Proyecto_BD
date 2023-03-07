import sys
import psycopg2

#Función para conectar la base de datos de Maria DB con Python
def conectar_BD():
    try:
        db = psycopg2.connect(user="pepe", 
                              password="pepe", 
                              host="localhost", 
                              database="pythonbbdd")

    except psycopg2.Error as e:
        print("No se pudo conectar a la base de datos:", e)
        sys.exit(1)

    print("Conexión correcta a MariaDB.")
    return db

#Función para desconetar la base de datos 
def desconectar_BD(db):
    db.close()

#Función del menú 
def menu():
    menu='''
    ----------------------------- PROYECTO PYTHON CON BBDD  ------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ------ 1. Listar información: Listarme toda información de la tabla aeropuerto -------------------------------------------------------------------------------------------------------
    ------ 2. Buscar o filtrar información: Pedir el codigo de los aeropuertos y que nos muestre la dirección de dicho aeropuerto --------------------------------------------------------
    ------ 3. Buscar información relacionada: Pedimos el codigo del aeropuerto de la tabla nacional y muestre la longuitud de la pista de aterrizaje y la orientación de las pistas ------
    ------ 4. Insertar información: Pedir un codigo de aeropuerto nuevo, dirección, teléfono y nombre de director ------------------------------------------------------------------------
    ------ 5. Borrar información: Pedir por teclado el código de empleado y que borre toda la información respetiva a ese empleado -------------------------------------------------------
    ------ 6. Actualizar información: Pedir el codigo del aeropuerto y modicar la dirección del mismo aeropuerto -------------------------------------------------------------------------
    ------ 7. Salir ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    '''
    print(menu)
    while True:
        try:
            opcion=int(input("Introduce la opción que usted quiera:"))
            return opcion
        except:
            print("Opción incorrecta, debe ser un número.")

#1 ejercicio -> Listar información: Listarme toda información de la tabla aeropuerto.
def opcion1(db):
    sql="SELECT * FROM aeropuerto;"
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        registros = cursor.fetchall()
        for registro in registros:
            print("Código aeropuerto:", registro[0], "Dirección:", registro[1], "Teléfono:", registro[2], "Nombre del director:", registro[3])
            
        return registros
        db.commit() 
    except:
        db.rollback()
        print("Error en la consulta.")

#2 ejercicio -> Buscar o filtrar información: Pedir el codigo de los aeropuertos y que nos muestre la dirección de dicho aeropuerto.
def opcion2(db):
    codigo_aeropuerto = input("Introduce el código del aeropuerto: ")
    sql="SELECT Direccion FROM aeropuerto WHERE cod_aeropuerto = '%s';" % (codigo_aeropuerto)
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        registros = cursor.fetchall()
        for registro in registros:
            print("Dirección:", registro[0])
            return registros
        db.commit()
    except:
        db.rollback()
        print("Error en la consulta.")

#3 ejercicio -> Buscar información relacionada: Pedimos el codigo del aeropuerto,que sea nacional, para que nos muestre la longuitud de la pista de aterrizaje y la orientación de las pistas (implico 2 tablas: nacional y aeropuerto).
def opcion3(db):
    codigo_aeropuerto_nacional = input("Introduce el codigo del aeropuerto nacional: ")
    sql = "SELECT n.Longitud_pista_aterrizaje, n.Orientacion_pista FROM nacional n  INNER JOIN aeropuerto a ON n.cod_aeropuerto = a.cod_aeropuerto WHERE a.cod_aeropuerto = '%s';" % (codigo_aeropuerto_nacional)
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        registros = cursor.fetchall()
        for registro in registros:
            longitud= registro[0]
            orientacion =registro[1]
            print("Longitud de pista de aterrizaje:",longitud,"Orientación de la pista:",orientacion)
        
        return registros
        db.commit()
    except:
        db.rollback()
        print("Error en la consulta.")

#4 ejercicio -> Insertar información: Pedir un codigo de aeropuerto nuevo, su respectiva dirección, teléfono y nombre de director.
def opcion4(db):
    codigo_nuevo = input("Introduce el código nuevo del aeropuerto: ")
    direccion_nueva = input("Introduce la dirección nueva: ") 
    telefono_nuevo = int(input("Introduzca el teléfono del aeropuerto (de 9 cifras): "))
    nombre_director_nuevo = input("Introduzca el nombre del nuevo director: ")
    sql = "INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) SELECT ('%s', '%s', '%d', '%s') FROM aeropuerto;" % (codigo_nuevo, direccion_nueva, telefono_nuevo, nombre_director_nuevo)
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        print("Aeropuerto insertado correctamente.")
        db.commit()
    except:
        db.rollback()
        print("Error en la inserción del aeropuerto.")

#5 ejercicio -> Borrar información: Pedir por teclado el código de empleado y que borre toda la información respetiva a ese empleado.
def opcion5(db):
    codigo_empleado = input("Introduce el codigo del empleado: ")
    sql= "DELETE FROM tripulacion WHERE cod_empleado = '%s';" % (codigo_empleado)
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        print("Se han eliminado todos los datos respetivos a datos del empleado.")
        db.commit()
    except:
        db.rollback()
        print("Error, no se ha encontrado ningún empleado con este código.")

#6 ejercicio -> Actualizar información: Pedir el codigo del aeropuerto y modicar la dirección del mismo aeropuerto.
def opcion6(db):
    codigo_aeropuerto = input("Introduce el codigo del aeropuerto que quieres modificar su dirección: ")
    direccion_nueva = input("Introduce la dirección a modificar: ") 
    sql= "UPDATE aeropuerto SET Direccion = '%s' WHERE cod_aeropuerto = '%s';" % (direccion_nueva, codigo_aeropuerto)
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        print("El aeropuerto con codigo ",codigo_aeropuerto," con nueva dirección ",direccion_nueva,", ha sido moficado correctamente.")
        db.commit()
    except:
        db.rollback()
        print("Error a la hora de modificar la tabla aeropuerto.")
