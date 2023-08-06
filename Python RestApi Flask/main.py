from flask import Flask, request, jsonify
import mysql.connector
from mysql.connector import (connection)
from mysql.connector import errorcode
app = Flask(__name__)

@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()

    try:
        username = data['username']
        email = data['email']
        password = data['password']
        ifRegister = checkIfRegister(email)

        if username=="" or email=="" or password=="":
            return jsonify("one of the textfield is empty"),400

        elif ifRegister:
            return jsonify("user exist"), 200

        else:
            cnx = connection.MySQLConnection(user='root', password='password', host='127.0.0.1', database='users')
            cursor = cnx.cursor()
            query = ("INSERT INTO users (username, email, password) "
                      "VALUES (%s, %s, %s)")
            cursor.execute(query, (username, email, password))
            cnx.commit()
            return jsonify({'username': username, 'email': email, 'password': password}), 201

    except KeyError:
        return jsonify("not enough parameters"),404


@app.route('/login', methods=['POST'])
def loginEndpoint():
    data = request.get_json()
    email = data['email']
    password = data['password']

    try:
        cnx = connection.MySQLConnection(user='root', password='password',host='127.0.0.1',database='users')
        cursor = cnx.cursor()
        query = ("SELECT username, email,id  FROM Users WHERE email = %s AND password = %s")
        val=(email,password)
        cursor.execute(query,val)
        returnData = cursor.fetchall()

        if returnData:
            returnDataTuple=returnData[0]
            id=returnDataTuple[2]
            cnx.close()
            return jsonify({'email': email, 'password': password,"id":id}),200

        else:
            cnx.close()
            return jsonify("user does not exist"),204

    except mysql.connector.Error as err:

        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            return jsonify("Something is wrong with your user name or password"),404

        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            return jsonify("Database does not exist"), 404

        else:
            return jsonify("Something goes wrong"), 404
    else:
        cnx.close()




def checkIfRegister(email):
    try:
        cnx = connection.MySQLConnection(user='root', password='password',host='127.0.0.1',database='users')
        cursor = cnx.cursor()
        query = ("SELECT username, email  FROM Users WHERE email = %s ")
        val=(email,)
        cursor.execute(query,val)

        if cursor.fetchall():
            print("user exists")
            cnx.close()
            return True

        else:
            cnx.close()
            return False

    except mysql.connector.Error as err:

        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")

        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")

        else:
            print("Something goes wrong")

    else:
        cnx.close()

@app.route('/orderDishes',methods=['POST'])
def orderDishes():
    data = request.get_json()
    userId = data['userId']
    Pizza = data['pizza']
    Kebab = data['kebab']
    Cola = data['cola']
    HotDog = data['hotDog']
    IceCream = data['iceCream']
    Hamburgerer = data['hamburger']
    Coffee = data['coffee']
    Tea = data['tea']
    Cheeseburger = data['cheeseBurger']

    try:
        cnx = connection.MySQLConnection(user='root', password='password',host='127.0.0.1',database='users')
        cursor = cnx.cursor()
        query = ("INSERT INTO Orders (userId, Pizza, Kebab,Cola,HotDog,IceCream,Hamburger,Coffee,Tea,Cheeseburger)"
                 " VALUES (%s, %s,%s, %s, %s,%s, %s,%s, %s, %s)")
        cursor.execute(query,
                       (userId, Pizza, Kebab,Cola,HotDog,IceCream,Hamburgerer,Coffee,Tea,Cheeseburger))
        cnx.commit()
        return jsonify("order added successfully"),201

    except:
        return jsonify("error while adding order"),404


@app.route("/getAllOrders",methods=["POST"])
def getAllOrders():
    data = request.get_json()
    id = data['id']
    cnx = connection.MySQLConnection(user='root', password='password', host='127.0.0.1', database='users')
    cursor = cnx.cursor()
    queryOrders = ("SELECT Pizza, Kebab, Cola, HotDog, IceCream, Hamburger, Coffee, Tea, Cheeseburger  "
                   "FROM Orders WHERE userId = %s")
    val = (id,)
    cursor.execute(queryOrders, val)
    returnData = cursor.fetchall()
    pizzaCounter, kebabCounter, colaCounter, hotDogCounter, iceCreamCounter, \
    hamburgerCounter, coffeeCounter, teaCounter, cheeseburgerCounter=0,0,0,0,0,0,0,0,0

    for order in returnData:
        orderList=list(order)
        pizza, kebab, cola, hotDog, iceCream, hamburger, coffee, tea, cheeseburger=orderList

        pizzaCounter=pizzaCounter+int(pizza)
        kebabCounter = kebabCounter + int(kebab)
        colaCounter = colaCounter + int(cola)
        hotDogCounter = hotDogCounter + int(hotDog)
        iceCreamCounter = iceCreamCounter + int(iceCream)
        hamburgerCounter = hamburgerCounter + int(hamburger)
        coffeeCounter = coffeeCounter + int(coffee)
        teaCounter = teaCounter + int(tea)
        cheeseburgerCounter = cheeseburgerCounter + int(cheeseburger)

    data = {
        "pizzaCounter": pizzaCounter,
        "kebabCounter": kebabCounter,
        "colaCounter": colaCounter,
        "hotDogCounter": hotDogCounter,
        "iceCreamCounter": iceCreamCounter,
        "hamburgerCounter": hamburgerCounter,
        "coffeeCounter": coffeeCounter,
        "teaCounter": teaCounter,
        "cheeseburgerCounter": cheeseburgerCounter
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(host="0.0.0.0")
    