import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_python_rest_api_flask/allOrdersPage.dart';
import 'package:flutter_python_rest_api_flask/orderDishesPage.dart';
import 'package:http/http.dart' as http;



class MainPage extends StatelessWidget
{
  int id;
  MainPage({required this.id});


  @override
  Widget build(BuildContext context)
  {
    void _showAlert(BuildContext context ,String message)
    {
      showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text(message),
            actions: <Widget>
            [
              TextButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> getAllOrders(id) async
    {
      var url = Uri.parse('http://192.168.1.29:5000/getAllOrders');
      var headers =
      {
        'Content-Type': 'application/json',
      };

      var body =
      {
        "id":id
      };

      try
      {
        var response = await http.post(
          url,
          headers: headers,
          body: jsonEncode(body),
        );

        var data = response.body;
        print(data.runtimeType);
        Navigator.push(context, MaterialPageRoute(builder: (context) => AllOrdersPage(data:data)));
      }

      catch (e)
      {
        _showAlert(context,e.toString());
        print('Error: $e');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
        ),
        body: Center(child: Column(
          children: <Widget>
          [
            Text(""),
            Text('What do you want to do?',style: TextStyle(fontSize: 20)),
            Text("",style: TextStyle(fontSize: 10)),

            ElevatedButton(
              onPressed: ()
                {
                getAllOrders(id);
                },
              child: const Text('Show my orders',style: TextStyle(fontSize: 24)),
            ),

            ElevatedButton(
              onPressed: ()
                {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDishesPage(id:id)));
                },
              child: const Text('Order dishes',style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
        )
    );
  }
}