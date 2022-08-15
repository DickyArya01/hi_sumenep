import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/page/Splashscreen.dart';

class MySpalashscreen extends StatefulWidget {
  const MySpalashscreen({Key? key}) : super(key: key);

  @override
  State<MySpalashscreen> createState() => _MySpalashscreenState();
}

class _MySpalashscreenState extends State<MySpalashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Spalashscreen(),
    );
  }
}