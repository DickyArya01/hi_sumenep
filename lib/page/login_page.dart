import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late FToast fToast;
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isShowPasswordError = false;
  bool isRememberMe = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          emailInput(),
          passwordInput(),
          rememberCheckbox(),
          loginButton(),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 24,
              ),
            ),
          ),
          registerButton(),
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 84),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Silahkan Login \nLebih Dulu',
            style: blueTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 87,
                height: 4,
                margin: EdgeInsets.only(right: 4),
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

  Widget emailInput() {
    return Container(
      margin: EdgeInsets.only(
        top: 48,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteGreyColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration.collapsed(
          hintText: 'Username',
          hintStyle: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }

  Widget passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 32,
          ),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhiteGreyColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.visibility_outlined,
                color: kGreyColor,
              ),
            ],
          ),
        ),
        if (isShowPasswordError)
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              'Password kamu salah',
              style: redTextStyle,
            ),
          ),
      ],
    );
  }

  Widget rememberCheckbox() {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: isRememberMe,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            'Remember me',
            style: blueTextStyle,
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      height: 56,
      width: double.infinity,
      margin: EdgeInsets.only(top: 32),
      child: TextButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });

          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            if (passwordController.text != '123123') {
              setState(() {
                isShowPasswordError = true;
              });
              fToast.showToast(
                child: errorToast(),
                toastDuration: Duration(seconds: 2),
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              Navigator.pushNamed(context, '/home');
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
                'Login',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
      ),
    );
  }

  Widget registerButton() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don’t have an account?',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Register',
              style: blueTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget errorToast() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kRedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Password Salah',
        style: whiteTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}
