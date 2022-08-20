import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = data.length -1 ; i > 0; i--)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: kGreyColor,
                      borderRadius: const BorderRadius.all(Radius.circular(50))),
                  child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://www.99.co/blog/indonesia/wp-content/uploads/2022/06/foto-profil-wa-keren-pakai-kacamata.jpg')),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[i].user,
                    style: blackTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text('day-month-year', style: greyTextStyle.copyWith(fontSize: 10, fontWeight: medium),))
                ],
              ),
              subtitle: Text(data[i].comment, style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: medium
              ),),

            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Komentar",
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        backgroundColor: kWhiteColor,
        leadingWidth: 40,
        leading: Container(
          margin: const EdgeInsets.only(left: x8),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            color: kBlackColor,
            icon: const Icon(Icons.arrow_back),
            iconSize: 20,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        shadowColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light,
        ), //rubah warna status bar
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://www.99.co/blog/indonesia/wp-content/uploads/2022/06/foto-profil-wa-keren-pakai-kacamata.jpg",
          child: commentChild(komen),
          labelText: 'Tulis Komentar...',
          withBorder: false,
          errorText: 'Komentar tidak boleh kosong',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value =Comment(user: 'New User', comment: commentController.text);
                komen.add(value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: kWhiteColor,
          textColor: kBlackAccentColor,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: kBlueColor),
        ),
      ),
    );
  }
}
