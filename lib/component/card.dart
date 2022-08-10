import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/detail.dart';

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
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: x16),
            width: 350,
            height: 250,
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
                    Container(
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            wisata.url,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 12,
                        top: 12,
                      ),
                      child: Text(
                        wisata.title,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(x16, x8, 0, 0),
                      child: Text(wisata.desc),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
