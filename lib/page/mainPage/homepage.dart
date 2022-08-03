import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/mainPage/slidePanel/panelwidget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

List<String> category = [
  'Semua',
  'Rekomendasi',
  'Alam',
  'Budaya',
  'Kuliner',
  'Budaya',
];

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlidingUpPanel(
          minHeight: visualHeight(context) * 0.08,
          maxHeight: visualHeight(context),
          parallaxEnabled: true,
          parallaxOffset: 0.5,
          body: const Center(
            child: Text('Home page'),
          ),
          panelBuilder: (controller) => PanelWidget(controller: controller),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(x24)),
        ),
        Container(
          color: Colors.white,
          child: SizedBox(
            height: 52 ,
            width: visualHeight(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) => ButtonTheme(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(x16, x8, 0, 0),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(x8)
                      )
                    ),
                    child: Text(category[index])),

                )

              )
              )
                )
        )
    ]);
  }
}
