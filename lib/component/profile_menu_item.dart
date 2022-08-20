import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/login_page.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  int refer;
  ProfileMenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.refer
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(refer);
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
              // color: isLightMode ? kBlackColor : kWhiteColor,
            ),
            SizedBox(
              width: 20,
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
