import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          print("pindah halaman $index");
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide(color: kBlueColor)))),
        child: Text(
          category[index],
          style: blueTextStyle,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kBlueColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide(color: kBlueColor)))),
        child: Text(
          category[index],
          style: whiteTextStyle,
        ),
      );
    }
  }

  SlidingUpPanel slidingUpPanel(index) {
    return SlidingUpPanel(
      minHeight: visualHeight(context) * 0.08,
      maxHeight: visualHeight(context) * 0.76,
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
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            width: visualWidth(context),
            padding: EdgeInsets.only(left: x16, top: x16),
            child: Text(
              'Kategori',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold
              ),
            ),
          ),
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
                              child: buttonCategory(index)))))),
        ],
      )
    ]);
  }
}
