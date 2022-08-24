import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/component/customButton.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

void onPress() {
  print("di click");
}

class _editProfileState extends State<editProfile> {
  final UsernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  Widget UsernameInput() {
    return Container(
      margin: EdgeInsets.only(
        top: 24,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: UsernameController,
        decoration: InputDecoration(
          labelText: "Username",
          labelStyle: blueTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
          hintText: 'Username',
          hintStyle: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kLineDarkColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kBlueColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          filled: true,
          fillColor: kWhiteColor,
          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
        ),
        style: greyTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
      ),
    );
  }

  Widget PasswordInput() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 16,
          ),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: UsernameController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: blueTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  hintText: 'Password',
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kLineDarkColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kBlueColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  filled: true,
                  fillColor: kWhiteColor,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  suffixIcon: InkWell(
                    
                    child: Icon(
                      Icons.visibility_outlined,
                      color: kGreyColor,
                    ),
                  ),
                ),
                style:
                    greyTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              )),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Edit Profile',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: kWhiteColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              child: Padding(
                padding: EdgeInsetsDirectional.all(3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    slide,
                    height: visualWidth(context) * 0.3,
                    width: visualWidth(context) * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(top: x8),
              child: customButton("Ubah Foto", kBlueColor, BorderSide.none,
                  whiteTextStyle, 14, semiBold, onPress()),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: UsernameInput(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: PasswordInput(),
            ),
          ],
        ));
  }
}
