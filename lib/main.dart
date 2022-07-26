import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/user_model.dart';
import 'package:http/http.dart' as http;
// import 'package:hi_sumenep_app/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = 'no data';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo Api'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(output),
              ElevatedButton(
                  onPressed: () {
                    User.getUsers("2").then((users) {
                      output = "";
                      for (int i = 0; i < users.length; i++){
                        output = output +"["+ users[i].name + "]";

                      }
                      
                      setState(() {});
                      // output = users[i].name + ", ";
                    });
                  },
                  child: const Text("GET")),
            ],
          ),
        ),
      ),
    );
  }
}
