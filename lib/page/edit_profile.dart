import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/component/customButton.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:image_picker/image_picker.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

void onPress() {
  print("di click");
}

class _editProfileState extends State<editProfile> {
  
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  final UsernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final ConfirmpasswordController = TextEditingController(text: '');

  bool isShowPassword = false;

  void takePhoto() async {
    final XFile? _gambar = await _picker.pickImage(source: ImageSource.camera);
    // _cropImage(_gambar?.path);
    Navigator.pop(context);
    setState(() {
      
    });
  }

  void pickPhoto() async {
    final XFile? _gambar = await _picker.pickImage(source: ImageSource.gallery);
    // _cropImage(_gambar?.path);
    Navigator.pop(context);
    setState(() {
      _imageFile = XFile as PickedFile;
    });
  }

  // void _cropImage(filepath)async{
  //   CroppedFile? cropedImage = await ImageCropper().cropImage(
  //       sourcePath: filepath,
  //       compressFormat: ImageCompressFormat.jpg,
  //       compressQuality: 100,
  //   );
  //   if (cropedImage != null) {
  //     setState(() {
  //       // _imageFile = filepath;
  //       _imageFile = File(cropedImage.path) as PickedFile;
  //     });
  //   }
  // }

  Widget UsernameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextFormField(
            controller: UsernameController,
            decoration: InputDecoration(
              labelText: "Nama Lengkap",
              labelStyle: blueTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
              hintText: 'Nama Lengkap',
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
            style: blueTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
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
                obscureText: (isShowPassword) ? false : true,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: blueTextStyle.copyWith(
                    fontSize: 14,
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
                style:
                    blueTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: SizedBox(
            width: visualWidth(context),
            child: Text(
                "Data anda tidak akan berubah jika InputText dibiarkan kosong",
                maxLines: 3,
                style: blackAccentTextStyle),
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
            top: 4,
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
                obscureText: (isShowPassword) ? false : true,
                controller: ConfirmpasswordController,
                decoration: InputDecoration(
                  labelText: "Konfirmasi Password",
                  labelStyle: blueTextStyle.copyWith(
                    fontSize: 14,
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
                style:
                    greyTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              )),
            ],
          ),
        )
      ],
    );
  }

  Widget imageProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/slide.png"),
            ),
            Positioned(
              bottom: 4,
              right: -2,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (Builder) => ImagebottomSheet(),
                  );
                },
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: kBlueColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.all(12),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Icon(
                          Icons.camera_alt,
                          color: kWhiteColor,
                          size: 24,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ImagebottomSheet() {
    return Container(
      height: 100,
      width: visualWidth(context),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Text(
            "Pilih foto anda",
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: kWhiteColor, elevation: 0),
                  onPressed: () {
                    takePhoto();
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: kBlackAccentColor,
                  ),
                  label: Text("Camera", style: blackAccentTextStyle)),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: kWhiteColor, elevation: 0),
                  onPressed: () {
                    pickPhoto();
                  },
                  icon: Icon(
                    Icons.image,
                    color: kBlackAccentColor,
                  ),
                  label: Text(
                    "Galery",
                    style: blackAccentTextStyle,
                  )),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
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
                'Edit Profile',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
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
        body: ListView(
          children: [
            imageProfile(),
            UsernameInput(),
            PasswordInput(),
            Container(
              margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
              width: visualWidth(context),
              child: customButton("Simpan Perubahan", kBlueColor,
                  BorderSide.none, whiteTextStyle, 14, semiBold, onPress()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Batal",
                  style:
                      greyTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                ),
              ),
            ),
          ],
        ));
  }
}
