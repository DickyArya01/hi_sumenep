import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/component/detailHeader.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/home.dart';

class Spalashscreen extends StatefulWidget {
  const Spalashscreen({Key? key}) : super(key: key);

  @override
  State<Spalashscreen> createState() => _SpalashscreenState();
}

class _SpalashscreenState extends State<Spalashscreen> {
  String? get imageUrl => null;

   @override
  void initState(){
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.asset("assets/logo.png", width: 200,)),
              Text("from",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  letterSpacing: 2,
                )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
                child: Image.asset("assets/logo.png", width: 100,),
              )
            ],
          ),
        )
      )
    );
  }
}