import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

class AjuWisata extends StatefulWidget {
  const AjuWisata({Key? key}) : super(key: key);

  @override
  State<AjuWisata> createState() => _AjuWisataState();
}

class _AjuWisataState extends State<AjuWisata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: Container(
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              color: kBlackColor,
              icon: Icon(Icons.arrow_back)),
        ),
        title: Container(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: Text(
              'Pengajuan Wisata',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Center(
        child: Text('Pengajuan wisata'),
      ),
    );
  }
}
