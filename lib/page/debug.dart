import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/page/detail.dart';

class MyDebug extends StatefulWidget {
  const MyDebug({Key? key}) : super(key: key);

  @override
  State<MyDebug> createState() => _MyDebugState();
}

class _MyDebugState extends State<MyDebug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: const DetailPage(),
    );
  }
}