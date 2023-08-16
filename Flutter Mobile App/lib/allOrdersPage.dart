import 'dart:convert';

import 'package:flutter/material.dart';


class AllOrdersPage extends StatelessWidget
{
  String data;
  AllOrdersPage({required this.data});

  @override
  Widget build(BuildContext context)
  {
    Map<String, dynamic> jsonData = json.decode(data);

    int pizza = jsonData['pizzaCounter'];
    int kebab = jsonData['kebabCounter'];
    int cola = jsonData['colaCounter'];
    int hotDog = jsonData['hotDogCounter'];
    int iceCream = jsonData['iceCreamCounter'];
    int hamburger = jsonData['hamburgerCounter'];
    int coffee = jsonData['coffeeCounter'];
    int tea = jsonData['teaCounter'];
    int cheeseburger = jsonData['cheeseburgerCounter'];

    return Scaffold(
        appBar: AppBar(
          title: const Text('All orders page'),
        ),
        body: Center(child: Column(
          children: <Widget>
          [
            const Text(""),
            const Text("All your orders:",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            const Text(""),
            Text("pizza: $pizza",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            const Text(""),
            Text("kebab: $kebab",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            const Text(""),
            Text("cola: $cola",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            const Text(""),
            Text("hotDog: $hotDog",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            const Text(""),
            Text("iceCream: $iceCream",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            const Text(""),
            Text("hamburger: $hamburger",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            const Text(""),
            Text("coffee: $coffee",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            const Text(""),
            Text("tea: $tea",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),

            const Text(""),
            Text("cheeseburger: $cheeseburger",style: const TextStyle(fontSize: 24)),
            const Text(""),

            Container(
              width: double.infinity, // Set the width of the line to fill the screen horizontally
              height: 3.0,            // Set the height of the line (thickness)
              color: Colors.black,    // You can change the color of the line as needed
            ),
          ],
        ),
        )
    );
  }
}