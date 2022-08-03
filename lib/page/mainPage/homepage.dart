import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/mainPage/slidePanel/panelwidget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  OnPressed() {}

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: visualHeight(context) * 0.1,
      maxHeight: visualHeight(context) * 0.8,
      body: Center(
        child: Text('Home page'),
      ),
      panelBuilder: (controller) => PanelWidget(controller: controller),
    );
  }
}
