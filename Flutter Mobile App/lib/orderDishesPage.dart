import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class OrderDishesPage extends StatefulWidget
{
  const OrderDishesPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<StatefulWidget> createState() => _OrderDishesPageState();
}
int _counterPizza = 0;
int _counterKebab = 0;
int _counterCola = 0;
int _counterHotDog = 0;
int _counterIceCream = 0;
int _counterHamburger = 0;
int _counterCoffee = 0;
int _counterTea = 0;
int _counterCheeseburger = 0;


class _OrderDishesPageState extends State<OrderDishesPage>
{

  @override
  Widget build(BuildContext context)
  {

    void _incrementCounterPizza()
    {
      setState(()
      {
        _counterPizza=_counterPizza + 1;
        print(_counterPizza);
      });
    }

    void _decrementCounterPizza()
    {
      setState(()
      {
        if(_counterPizza>0)
        {
          _counterPizza=_counterPizza - 1;
        }
        print(_counterPizza);
      });
    }

    void _incrementCounterKebab()
    {
      setState(()
      {
        _counterKebab = _counterKebab + 1;
      });
    }

    void _decrementCounterKebab()
    {
      setState(()
      {
        if(_counterKebab>0)
        {
          _counterKebab = _counterKebab - 1;
        }
      });
    }

    void _incrementCounterCola()
    {
      setState(()
      {
        _counterCola = _counterCola + 1;
      });
    }

    void _decrementCounterCola()
    {
      setState(()
      {
        if(_counterCola>0)
        {
          _counterCola = _counterCola - 1;
        }
      });
    }

    void _incrementCounterHotDog()
    {
      setState(()
      {
        _counterHotDog = _counterHotDog + 1;
      });
    }

    void _decrementCounterHotDog()
    {
      setState(()
      {
        if(_counterHotDog>0)
        {
          _counterHotDog = _counterHotDog - 1;
        }
      });
    }

    void _incrementCounterIceCream()
    {
      setState(()
      {
        _counterIceCream = _counterIceCream + 1;
      });
    }

    void _decrementCounterIceCream()
    {
      setState(()
      {
        if(_counterIceCream>0)
        {
          _counterIceCream = _counterIceCream - 1;
        }
      });
    }

    void _incrementCounterHamburger()
    {
      setState(()
      {
        _counterHamburger = _counterHamburger + 1;
      });
    }

    void _decrementCounterHamburger()
    {
      setState(()
      {
        if(_counterHamburger>0)
        {
          _counterHamburger = _counterHamburger - 1;
        }
      });
    }

    void _incrementCounterCoffee()
    {
      setState(()
      {
        _counterCoffee = _counterCoffee + 1;
      });
    }

    void _decrementCounterCoffee()
    {
      setState(()
      {
        if(_counterCoffee>0)
        {
          _counterCoffee = _counterCoffee - 1;
        }
      });
    }

    void _incrementCounterTea()
    {
      setState(()
      {
        _counterTea = _counterTea + 1;
      });
    }

    void _decrementCounterTea()
    {
      setState(()
      {
        if(_counterTea>0)
        {
          _counterTea = _counterTea - 1;
        }
      });
    }

    void _incrementCounterCheeseburger()
    {
      setState(()
      {
        _counterCheeseburger = _counterCheeseburger + 1;
      });
    }

    void _decrementCounterCheeseburger()
    {
      setState(()
      {
        if(_counterCheeseburger>0)
        {
          _counterCheeseburger = _counterCheeseburger - 1;
        }
      });
    }

    void _showAlert(BuildContext context ,String message)
    {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> order(userId, Pizza, Kebab, Cola, HotDog, IceCream, Hamburger, Coffee, Tea, CheeseBurger) async
    {
      var url = Uri.parse('http://192.168.1.29:5000/orderDishes');
      var headers = {
        'Content-Type': 'application/json',
      };

      var body =
      {
        "userId": userId,
        "pizza": Pizza,
        "kebab": Kebab,
        "cola": Cola,
        "hotDog": HotDog,
        "iceCream": IceCream,
        "hamburger": Hamburger,
        "coffee": Coffee,
        "tea": Tea,
        "cheeseBurger": CheeseBurger
      };


      try
      {
        var response = await
        http.post(
          url,
          headers: headers,
          body: jsonEncode(body),
        );


        if (response.statusCode == 201)
        {
          var data = response.body;
          print(data);
          _showAlert(context, "Order finished successfully");
        }

        // else if (response.statusCode ==204)
        // {
        //   _showAlert(context,"user doesnt exist");
        // }

        else
        {
          _showAlert(context, "Order didnt finish successfully");
          print('Request failed with status: ${response.statusCode}');
        }

      }
      catch (e)
      {
        _showAlert(context,e.toString());
        print('Error: $e');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Order dishes'),
        ),
        body: Center(child: Column(
          children: <Widget>
          [
            Text(""),
            Text('What do you want to order?',style: TextStyle(fontSize: 20)),
            Text("",style: TextStyle(fontSize: 10)),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            Text("   "),

            Row(
              children: <Widget>
              [
                Text("   "),
                Text("Pizza",style: TextStyle(fontSize: 20)),
                Text("                                         "),

                SizedBox(
                  height:25,
                  width:60,
                  child:ElevatedButton(
                    onPressed: _decrementCounterPizza,
                    child: Icon(Icons.remove),
                  ),
                ),

                Text("   "),
                Text(
                  ' $_counterPizza ',
                  style: TextStyle(fontSize: 24),
                ),

                Text("   "),
                SizedBox(
                  height:25,
                  width:60,
                  child:ElevatedButton(
                    onPressed: _incrementCounterPizza,
                    child: Icon(Icons.add),
                  ),
                )

              ],
            ),

            Text("   "),
            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
            Text("   "),

            Row(
              children: <Widget>
              [
                Text("   "),
                Text("Kebab", style: TextStyle(fontSize: 20)),
                Text("                                       "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _decrementCounterKebab,
                    child: Icon(Icons.remove),
                  ),
                ),

                Text("   "),
                Text(
                  ' $_counterKebab ',
                  style: TextStyle(fontSize: 24),
                ),
                Text("   "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _incrementCounterKebab,
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),

            Text("   "),
            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
            Text("   "),

            Row(
              children: <Widget>
              [
                Text("   "),
                Text("Cola", style: TextStyle(fontSize: 20)),
                Text("                                           "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _decrementCounterCola,
                    child: Icon(Icons.remove),
                  ),
                ),

                Text("   "),
                Text(
                  ' $_counterCola ',
                  style: TextStyle(fontSize: 24),
                ),
                Text("   "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _incrementCounterCola,
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),

            Text("   "),
            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
            Text("   "),

            Row(
              children: <Widget>
              [
                Text("   "),
                Text("Hot Dog", style: TextStyle(fontSize: 20)),
                Text("                                   "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _decrementCounterHotDog,
                    child: Icon(Icons.remove),
                  ),
                ),

                Text("   "),
                Text(
                  ' $_counterHotDog ',
                  style: TextStyle(fontSize: 24),
                ),
                Text("   "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _incrementCounterHotDog,
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),

            Text("   "),
            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
            Text("   "),

            Row(
              children: <Widget>
              [
                Text("   "),
                Text("Ice Cream", style: TextStyle(fontSize: 20)),
                Text("                               "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _decrementCounterIceCream,
                    child: Icon(Icons.remove),
                  ),
                ),

                Text("   "),
                Text(
                  ' $_counterIceCream ',
                  style: TextStyle(fontSize: 24),
                ),
                Text("   "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _incrementCounterIceCream,
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),

            Text("   "),
            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
            Text("   "),
            Row(
              children: <Widget>
              [
                Text("   "),
                Text("Hamburger", style: TextStyle(fontSize: 20)),
                Text("                           "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _decrementCounterHamburger,
                    child: Icon(Icons.remove),
                  ),
                ),

                Text("   "),
                Text(
                  ' $_counterHamburger ',
                  style: TextStyle(fontSize: 24),
                ),
                Text("   "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _incrementCounterHamburger,
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),

            Text("   "),
            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
            Text("   "),

            Row(
              children: <Widget>
              [
                Text("   "),
                Text("Coffee", style: TextStyle(fontSize: 20)),
                Text("                                      "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _decrementCounterCoffee,
                    child: Icon(Icons.remove),
                  ),
                ),

                Text("   "),
                Text(
                  ' $_counterCoffee ',
                  style: TextStyle(fontSize: 24),
                ),
                Text("   "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _incrementCounterCoffee,
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),

            Text("   "),
            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
            Text("   "),
            Row(
              children: <Widget>
              [
                Text("   "),
                Text("Tea", style: TextStyle(fontSize: 20)),
                Text("                                             "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _decrementCounterTea,
                    child: Icon(Icons.remove),
                  ),
                ),

                Text("   "),
                Text(
                  ' $_counterTea ',
                  style: TextStyle(fontSize: 24),
                ),
                Text("   "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _incrementCounterTea,
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),

            Text("   "),
            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
            Text("   "),

            Row(
              children: <Widget>
              [
                Text("   "),
                Text("Cheeseburger", style: TextStyle(fontSize: 20)),
                Text("                    "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _decrementCounterCheeseburger,
                    child: Icon(Icons.remove),
                  ),
                ),

                Text("   "),
                Text(
                  ' $_counterCheeseburger ',
                  style: TextStyle(fontSize: 24),
                ),
                Text("   "),

                SizedBox(
                  height: 25,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: _incrementCounterCheeseburger,
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),

            Text("   "),
            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
            Text("   "),

            ElevatedButton(
              onPressed: ()
              {
                order(widget.id,_counterPizza, _counterKebab, _counterCola, _counterHotDog, _counterIceCream, _counterHamburger, _counterCoffee, _counterTea, _counterCheeseburger);
              },

              child: const Text("Order",style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
        )
    );
  }
}