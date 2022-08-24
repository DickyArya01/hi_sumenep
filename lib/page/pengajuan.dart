import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AjuWisata extends StatefulWidget {
  const AjuWisata({Key? key}) : super(key: key);

  @override
  State<AjuWisata> createState() => _AjuWisataState();
}

class _AjuWisataState extends State<AjuWisata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Pengajuan wisata'),),
    );
  }
}
