import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

import 'home.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String? get imageUrl => null;

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
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
              Expanded(
                  child: Image.asset(
                "assets/HiSumenep.png",
                width: 128,
              )),
              Text("by",
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                    letterSpacing: 2,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
                child: Image.asset(
                  "assets/Soulofmadura.png",
                  width: 120,
                ),
              )
            ],
          ),
        )));
  }
}
