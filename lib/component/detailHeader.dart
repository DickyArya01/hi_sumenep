import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class detailHeader extends StatelessWidget {
   final String imageUrl;
   detailHeader(this.imageUrl);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 332,
      width: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(imageUrl),
      //     fit: BoxFit.cover)
      // ),
      child: Swiper(
        itemBuilder: (context, index){
          return Image.asset(
            imageUrl,
            fit: BoxFit.fill,
          );
        },
        autoplay: false,
        itemCount: 3,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      )
    );
  }
}