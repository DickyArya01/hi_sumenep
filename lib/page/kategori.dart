import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/component/card.dart';
import 'package:hi_sumenep_app/constant/constant.dart';


class KategoriPage extends StatefulWidget {
  int index;
  KategoriPage({Key? key, required this.index}) : super(key: key);

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: Container(
          margin: const EdgeInsets.only(left: x8),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            iconSize: 20,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(right: 40),
          width: visualWidth(context),
          child: Text(
            category[widget.index],
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light,
        ), //rubah warna status bar
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: x16),
          itemCount: listCategory[widget.index].length,
          itemBuilder: (context, int index) => CustomCard(
            wisata: listCategory[widget.index][index],
          ),
        ),
      ),
    );
  }
}
