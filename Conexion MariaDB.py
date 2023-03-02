#Conexión Python con Maria DB
import sys
import MySQLdb
try:
	db = MySQLdb.connect("localhost","pepe","root","pythonbbdd" )
except MySQLdb.Error as e:
	print("No puedo conectar a la base de datos:",e)
	sys.exit(1)
print("Conexión correcta.")
db.close()

#