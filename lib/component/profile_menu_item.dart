import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/edit_profile.dart';
import 'package:hi_sumenep_app/page/login_page.dart';
import 'package:hi_sumenep_app/page/pengajuan.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  int refer;
  ProfileMenuItem(
      {Key? key,
      required this.iconUrl,
      required this.title,
      required this.refer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(refer);
        switch (refer) {
          case 0:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const editProfile()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AjuWisata()));
            break;
          default:
        }
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Image.asset(
                iconUrl,
                width: 24,
                // color: isLightMode ? kBlackColor : kWhiteColor,
              ),
            ),
            Text(
              title,
              style: blackAccentTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right,
              color: kBlueColor,
            ),
          ],
        ),
      ),
    );
  }
}
