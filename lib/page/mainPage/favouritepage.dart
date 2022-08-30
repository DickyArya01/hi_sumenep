import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/component/card.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (dataFav.isNotEmpty)
        ? Center(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: x16),
                itemCount: dataFav.length,
                itemBuilder: (context, int index) => Dismissible(
                      key: Key(dataFav[index].title),
                      onDismissed: (direction) {
                        setState(() {
                          dataFav.removeAt(index);
                        });
                      },
                      child: CustomCard(
                        wisata: dataFav[index],
                      ),
                    )),
          )
        : Center(
            child: Text('Anda belum menambahkan favourite'),
          );
  }
}
