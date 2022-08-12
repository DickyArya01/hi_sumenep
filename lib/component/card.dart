import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/detail.dart';

Container cardImage(context, String url){
  return Container(
                      width: visualWidth(context),
                      height: visualHeight(context) * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            url,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
}

Container descText (String title){
  return Container(
                          margin: const EdgeInsets.only(
                            left: 24,
                            top: 4,
                          ),
                          child: Text(
                            title,
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                        );
}

Container favouriteButton (){
  return Container(
    margin: EdgeInsets.only(right: 24, top: 4),
    child: IconButton(
      onPressed: () {
        print('tambahkan ke favorit');
        },
        icon: Icon(
          Icons.favorite,
          color: Colors.grey,
          size: 24,
          )),
  );
}

Stack cardItem(context, String title, String url, String desc ){
  return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: x16),
            width: visualWidth(context),
            height: visualHeight(context) * 0.42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 6,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cardImage(context, url),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        descText(title),
                        favouriteButton()
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 24),
                      child: Text(desc,
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
}

class CustomCard extends StatelessWidget {
  final Wisata wisata;

  CustomCard({required this.wisata});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detail(wisata: wisata)));
      },
      child: cardItem(context, wisata.title, wisata.url, wisata.desc)
    );
  }
}

