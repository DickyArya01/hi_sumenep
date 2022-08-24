import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/edit_profile.dart';
import 'package:hi_sumenep_app/page/home.dart';
import 'package:hi_sumenep_app/page/login_page.dart';
import 'package:hi_sumenep_app/page/mainPage/homepage.dart';

class Spalashscreen extends StatefulWidget {
  const Spalashscreen({Key? key}) : super(key: key);

  @override
  State<Spalashscreen> createState() => _SpalashscreenState();
}

class _SpalashscreenState extends State<Spalashscreen> {
  String? get imageUrl => null;

   @override
  void initState(){
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
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
              Expanded(child: Image.asset("assets/HiSumenep.png", width: 128,)),
              Text("by",
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                  letterSpacing: 2,
                )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
                child: Image.asset("assets/Soulofmadura.png", width: 120,),
              )
            ],
          ),
        )
      )
    );
  }
}