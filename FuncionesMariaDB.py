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
