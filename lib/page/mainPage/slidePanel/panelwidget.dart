import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

class PanelWidget extends StatefulWidget {
  ScrollController controller;
  int indexCategory;
  PanelWidget({Key? key, required this.controller, required this.indexCategory})
      : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  List<Wisata> data = [];

  @override
  void initState() {
    super.initState();
    data = implementData(widget.indexCategory);
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          buildDragHandle(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: x16),
            child: Center(
              child: Text(
                '${data.length} $panelSlideHint',
                style: const TextStyle(fontSize: x16),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: x16),
                controller: widget.controller,
                itemCount: data.length,
                itemBuilder: (context, int index) => Column(
                      children: [
                        Image(image: NetworkImage(data[index].url)),
                        Text(
                          '${data[index].title} $index',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: x16),
                        ),
                        Text(data[index].desc),
                        Text('${data[index].category}')
                      ],
                    )),
          )
        ],
      );

  Widget buildDragHandle() => Center(
        child: Container(
          margin: const EdgeInsets.only(top: x8),
          width: 30,
          height: 5,
          decoration: BoxDecoration(color: Colors.grey[400]),
        ),
      );
}
