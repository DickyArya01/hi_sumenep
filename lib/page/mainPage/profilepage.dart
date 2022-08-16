import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/component/profile_menu_item.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) { 
    // return Center(
    //   child: Text('Profile'),
    //   );

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: visualWidth(context),
            height: 280,
            decoration: BoxDecoration(
              color: kWhiteGreyColor,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: kWhiteColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(slide, height: 120, width: 120, fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsetsDirectional.only(bottom: 20),),
                  Text("Nama Pengguna", 
                  style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: black,
                  letterSpacing: 2,
                  ),
                ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProfileMenuItem(
                  iconUrl: "assets/HiSumenep.png",
                  title: "Edit Profile",
                ),
                ProfileMenuItem(
                  iconUrl: "assets/HiSumenep.png",
                  title: "Edit Profile",
                ),
                ProfileMenuItem(
                  iconUrl: "assets/HiSumenep.png",
                  title: "Edit Profile",
                )
              ],
            ),
          )
        ],
      ),
    );
}
}