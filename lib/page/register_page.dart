import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';

import '../component/customButton.dart';
import '../constant/constant.dart';
import 'home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  void onPress() {
    print("di click");
  }

  late FToast fToast;
  final usernameController = TextEditingController(text: '');
  final NameController = TextEditingController(text: '');
  final PasswordController = TextEditingController(text: '');
  final ConfirmPasswordController = TextEditingController(text: '');

  bool isShowPassword = false;
  bool isPasswordWrong = false;
  bool isRememberMe = false;
  bool isLoading = false;

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(top: 84),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registrasi \nLebih Dulu',
            style: blueTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 87,
                height: 4,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kBlueColor,
                ),
              ),
              Container(
                width: 8,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kBlueColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget NameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 48),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextFormField(
            controller: NameController,
            decoration: InputDecoration(
              labelText: "Nama Lengkap",
              labelStyle: blueTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
              hintText: 'Isi nama lengkap anda',
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
            style: blackAccentTextStyle.copyWith(
                fontSize: 16, fontWeight: semiBold),
          ),
        ),
      ],
    );
  }

  Widget UsernameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: "Username",
              labelStyle: blueTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
              hintText: 'Isi username anda',
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
            style: blackAccentTextStyle.copyWith(
                fontSize: 16, fontWeight: semiBold),
          ),
        ),
      ],
    );
  }

  Widget PasswordInput() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 24,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                obscureText: (isShowPassword) ? false : true,
                controller: PasswordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: blueTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                  hintText: 'Isi password anda',
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
                    onTap: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                      print(isShowPassword);
                    },
                    child: Icon(
                      isShowPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: kGreyColor,
                    ),
                  ),
                ),
                style: blackAccentTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold),
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget ConfirmPasswordInput() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 24,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                obscureText: (isShowPassword) ? false : true,
                controller: ConfirmPasswordController,
                decoration: InputDecoration(
                  labelText: "Konfirmasi Password",
                  labelStyle: blueTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                  hintText: ' Tulis password anda',
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
                    onTap: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                      print(isShowPassword);
                    },
                    child: Icon(
                      isShowPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: kGreyColor,
                    ),
                  ),
                ),
                style: blackAccentTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold),
              )),
            ],
          ),
        )
      ],
    );
  }

  Widget iconShowPassword(IconData iconData) {
    return Icon(
      iconData,
      color: kGreyColor,
      size: 12,
    );
  }

  Widget errorToast() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kRedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'password anda tidak sama',
        style: whiteTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            title(),
            NameInput(),
            UsernameInput(),
            PasswordInput(),
            ConfirmPasswordInput(),
            registerbutton(),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Center(
                child: TextButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home())),
                  child: Text(
                    'Batal',
                    style: blueTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget registerbutton() {
    return Container(
      height: 56,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 32),
      child: TextButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });

          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            if (NameController.text != 'admin' ||
                usernameController.text != 'admin' ||
                PasswordController.text != '1122334' ||
                ConfirmPasswordController.text != '11223344') {
              setState(() {
                isPasswordWrong = true;
              });
              fToast.showToast(
                child: errorToast(),
                toastDuration: const Duration(seconds: 2),
                gravity: ToastGravity.BOTTOM,
              );
              //
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false);
              isLogin = true;
            }
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: kBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: kWhiteColor,
                backgroundColor: kBlackColor,
              )
            : Text(
                'Register',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
      ),
    );
  }
}
