import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/component/customButton.dart';
import 'package:hi_sumenep_app/component/profile_menu_item.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/home.dart';
import 'package:hi_sumenep_app/page/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

onPress(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()) );
  }

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: visualWidth(context),
            height: visualHeight(context)*0.35,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/banner_profile.png')
              )
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 8),
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
                      padding: EdgeInsetsDirectional.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          slide,
                          height: visualWidth(context)*0.3,
                          width: visualWidth(context)*0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsetsDirectional.only(bottom: 16),),
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 20),
                ProfileMenuItem(
                  iconUrl: "assets/HiSumenep.png",
                  title: "Edit Profile",
                  refer: 0,
                ),
                ProfileMenuItem(
                  iconUrl: "assets/HiSumenep.png",
                  title: "Ajukan Wisata Baru",
                  refer: 1,

                ),
                SizedBox(height: 8),
                Container(
                  width: visualWidth(context),
                  child: 
                  Text(
                    "Logout",
                    style: redTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}