import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/pages/index.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IndexPage() ,
    );
  }
}
