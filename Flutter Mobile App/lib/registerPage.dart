import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    final userNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    void _showAlert(BuildContext context ,String message)
    {
      showDialog(
        context: context,
        builder: (BuildContext context)
        {
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

    Future<void> postData(username,email,password) async
    {
      var url = Uri.parse('http://192.168.1.29:5000/register');
      var headers = {
        'Content-Type': 'application/json',
      };

      var body = {
        'username': username,
        'email': email,
        'password': password
      };

      try{
        var response = await
        http.post(
          url,
          headers: headers,
          body: jsonEncode(body),
        );

        if(response.statusCode ==400)
        {
          _showAlert(context, "one of the textfield is empty");
        }
        if (response.statusCode == 200)
        {
          var data = response.body;
          print(data);
          _showAlert(context, "User exist");
        }
        else if (response.statusCode ==201)
        {
          _showAlert(context, "User created successfully");
        }

        else {
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
        title: const Text('Register Page'),
      ),
      body: Column(
        children:
        [
          const Text(""),
          const Text(""),
          TextField(
            controller:userNameController,
            decoration:  InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
            ),
          ),
          const Text(""),

          TextField(
            controller:emailController,
            decoration:  const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
            ),
          ),
          const Text(""),

          TextField(
            controller:passwordController,
            decoration:  const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: ()
            {
              postData(userNameController.text,emailController.text,passwordController.text);
            },
            child: const Text('Register',style: TextStyle(fontSize: 25)),
          ),
        ],
      ),
    );
  }
}