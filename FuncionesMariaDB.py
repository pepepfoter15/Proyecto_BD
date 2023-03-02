import sys
import mysql.connector

def conectar_BD(host, user, password, database):
    try:
        db = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
    except mysql.connector.Error as e:
        print("No se pudo conectar a la base de datos:", e)
        sys.exit(1)

    print("Conexión correcta a MariaDB.")
    return db

def desconectar_BD(db):
    db.close()

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
            print("Opción incorrecta, debe ser un número")

def opcion1(db):
    sql="SELECT * FROM aeropuerto;"
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        registros = cursor.fetchall()
        for registro in registros:
            print("Código aeropuerto:", registro[0], "Dirección:", registro[1], "Teléfono:", registro[2], "Nombre del director:", registro[3])

        db.commit()
    except:
        db.rollback()
        print("Error en la consulta.")

def opcion2(db):
    codigo_aeropuerto = input("Introduce el código del aeropuerto: ")
    sql="SELECT Direccion FROM aeropuerto WHERE cod_aeropuerto = %s;" % (codigo_aeropuerto)

    cursor = db.cursor()
    try:
        cursor.execute(sql)

        db.commit()
    except:
        db.rollback()
        print("Error en la consulta.")

def opcion3(db):
    codigo_aeropuerto_nacional = input("Introduce el modelo de remolque: ")
    sql = "SELECT Longitud_pista_aterrizaje, Orientacion_pista FROM nacional n WHERE cod_aeropuerto = %s in (SELECT cod_aeropuerto FROM aeropuerto a WHERE n.cod_aeropuerto = n.cod_aeropuerto);" % codigo_aeropuerto_nacional
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        registros = cursor.fetchall()
        for registro in registros:
            longitud= registro[0]
            orientacion =registro[1]
            print("Longitud de pista de aterrizaje:",longitud,"Orientación de la pista:",orientacion)
        db.commit()
    except:
        db.rollback()
        print("Error en la consulta")

def opcion4(db):
    cursor = db.cursor()
    codigo_nuevo = input("Introduce el código nuevo del aeropuerto:")
    direccion_nueva = 
    telefono_nuevo =
    nombre_director_nuevo =

    if tipo_remolque == "CISTERNA":
        capacidad = input("Introduce la capacidad de la cisterna (debe ser entre 2000 y 20000): ")
        tipo_mercancia = input("Introduce el tipo de mercancía (PELIGROSO o NO PELIGROSO): ")
        sql = "INSERT INTO Remolque_Cisterna (matricula_remolque, capacidad, tipo_mercancia) VALUES ('%s', '%s', UPPER('%s'))" % (matricula, capacidad, tipo_mercancia)
    elif tipo_remolque == "FRIGORIFICO":
        capacidad = input("Introduce la capacidad del frigorífico (deber ser entre 2000 y 20000): ")
        rango_temperatura = input("Introduce el rango de temperatura (debe ser entre -30 y 10): ")
        sql = "INSERT INTO Remolque_Frigorifico (matricula_remolque, capacidad, rango_temperatura) VALUES ('%s', '%s', '%s')" % (matricula, capacidad, rango_temperatura)
    else:
        capacidad = input("Introduce la capacidad del remolque (debe ser entre 2000 y 20000): ")
        sql = "INSERT INTO Remolque_Normal (matricula_remolque, capacidad) VALUES ('%s', '%s')" % (matricula, capacidad)

    sql2 = "INSERT INTO Remolque (matricula, modelo, peso, codigo_parque) VALUES ('%s', UPPER('%s'), '%s', UPPER('%s'))" % (matricula, modelo, peso, codigo_parque)

    try:
        cursor.execute(sql2)
        cursor.execute(sql)
        db.commit()
        print("Remolque insertado correctamente.")
    except:
        db.rollback()
        print("Error al insertar el remolque.")


def opcion5(db):
    matricula = input("Introduce la matricula del remolque que deseas eliminar: ")
    cursor = db.cursor()
    try:
        sql = "DELETE FROM Remolque_Cisterna WHERE matricula_remolque = '%s'" % matricula
        cursor.execute(sql)
        if cursor.rowcount > 0:
            print("Se ha eliminado la información del remolque en la tabla Remolque Cisterna.")

        sql = "DELETE FROM Remolque_Frigorifico WHERE matricula_remolque = '%s'" % matricula
        cursor.execute(sql)
        if cursor.rowcount > 0:
            print("Se ha eliminado la información del remolque en la tabla Remolque Frigorifico.")

        sql = "DELETE FROM Remolque_Normal WHERE matricula_remolque = '%s'" % matricula
        cursor.execute(sql)
        if cursor.rowcount > 0:
            print("Se ha eliminado la información del remolque en la tabla Remolque Normal.")

        sql = "DELETE FROM Remolque WHERE matricula = '%s'" % matricula
        cursor.execute(sql)
        if cursor.rowcount == 0:
            print("No existe ningún remolque con la matrícula introducida.")
        else:
            print("Se ha eliminado el remolque de la tabla Remolque.")

        db.commit()
        print("Se han eliminado todos los datos relacionados con la matrícula introducida.")

    except:
        db.rollback()
        print("Ha ocurrido un error al intentar eliminar los datos del remolque.")

def opcion6(db):
    matricula = input("Introduce la matrícula del remolque que deseas actualizar: ")
    peso = int(input("Introduce el nuevo peso del remolque: "))
    cursor = db.cursor()
    try:
        sql = "UPDATE Remolque SET peso = %d WHERE matricula = '%s'" % (peso, matricula)
        cursor.execute(sql)
        if cursor.rowcount == 0:
            print("No existe ningún remolque con la matrícula introducida.")
        else:
            print("Se ha actualizado el peso del remolque en la tabla Remolque.")
        db.commit()
    except:
        db.rollback()
        print("Error al intentar actualizar el peso del remolque.")