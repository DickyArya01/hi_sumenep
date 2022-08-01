import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  OnPressed() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(top: x24),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    // controller: controller,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: hintText,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(x40),
                            borderSide: BorderSide(
                              color: Colors.grey.shade800,
                            ))),
                  ),
                ),
                Transform.rotate(
                  angle: 90,
                  child: IconButton(
                      onPressed: OnPressed,
                      icon: const Icon(Icons.candlestick_chart)),
                )
              ],
            ))
      ],
    );
  }
}
