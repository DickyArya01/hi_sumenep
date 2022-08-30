import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/home.dart';
import 'package:hi_sumenep_app/page/register_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late FToast fToast;
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isShowPassword = false;
  bool isPasswordWrong = false;
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
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          usernameInput(),
          passwordInput(),
          rememberCheckbox(),
          loginButton(),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Center(
              child: TextButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home())),
                child: Text(
                  'Lain Kali',
                  style: blueTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium
                  ),),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(
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
      margin: const EdgeInsets.only(top: 84),
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

  Widget usernameInput() {
    return Container(
      margin: const EdgeInsets.only(
        top: 48,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteGreyColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: usernameController,
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
          margin: const EdgeInsets.only(
            top: 32,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhiteGreyColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: (isShowPassword) ? false : true,
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
              IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                  print(isShowPassword);
                },
                icon: (isShowPassword)
                    ? iconShowPassword(Icons.visibility_off_outlined)
                    : iconShowPassword(Icons.visibility_outlined),
              ),
            ],
          ),
        ),
        if (isPasswordWrong)
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              'Username atau password kamu salah',
              style: redTextStyle,
            ),
          ),
      ],
    );
  }

  Widget iconShowPassword(IconData iconData) {
    return Icon(
      iconData,
      color: kGreyColor,
    );
  }

  Widget rememberCheckbox() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
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
          const SizedBox(width: 8),
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
            if (passwordController.text != 'admin' ||
                usernameController.text != 'admin') {
              setState(() {
                isPasswordWrong = true;
              });
              fToast.showToast(
                child: errorToast(),
                toastDuration: const Duration(seconds: 2),
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Home()), (route) => false);
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
      margin: const EdgeInsets.only(top: 24),
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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
            },
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kRedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Username atau password Salah',
        style: whiteTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}
