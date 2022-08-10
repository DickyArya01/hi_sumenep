import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/component/map.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/mainPage/slidePanel/panelwidget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentCategory = 0;

  @override
  void initState() {
    super.initState();
  }

  ElevatedButton buttonCategory(int index) {
    if (currentCategory != index) {
      return ElevatedButton(
        onPressed: () {
          currentCategory = index;
          implementData(index);
          setState(() {
            buttonCategory(index);
            slidingUpPanel(index);
          });
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(x8),
                    side: const BorderSide(color: Colors.blue)))),
        child: Text(
          category[index],
          style: const TextStyle(color: Colors.blue),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(x8),
                    side: const BorderSide(color: Colors.blue)))),
        child: Text(
          category[index],
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  SlidingUpPanel slidingUpPanel(index) {
    return SlidingUpPanel(
      minHeight: visualHeight(context) * 0.08,
      maxHeight: visualHeight(context) * 0.8,
      parallaxEnabled: true,
      parallaxOffset: 0.5,
      body: MapSample(),
      panelBuilder: (controller) => PanelWidget(
        controller: controller,
        indexCategory: index,
        onTap: (value) {

        },
      ),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(x24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      slidingUpPanel(currentCategory),
      Container(
          color: Colors.white,
          child: SizedBox(
              height: 68,
              width: visualHeight(context),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) => ButtonTheme(
                      child: Container(
                          padding: (index == category.length - 1)
                              ? const EdgeInsets.fromLTRB(x16, x16, x16, x16)
                              : const EdgeInsets.fromLTRB(x16, x16, 0, x16),
                          child: buttonCategory(index))))))
    ]);
  }
}
