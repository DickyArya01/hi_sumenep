import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/page/detail.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

//
  final Set<Marker> markers = new Set();

  // List users = [];
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-7.21667, 113.7862578625378625),
    zoom: 9.65624,
  );

  @override
  void initState() {
    super.initState();
    // fetchState();
    // marker.addAll(list);
  }

  // fetchState() async {
  //   print("fetch map...");
  //   var url = url_user;
  //   var response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     var items = json.decode(response.body)['results'];

  //     setState(() {
  //       users = items;
  //     });
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      // markers: Set<Marker>.of(marker),

      markers: getMarkers(dataDummmy),
      myLocationEnabled: true,
    );
  }

  Set<Marker> getMarkers(List<Wisata> items) {
    for (int i = 0; i < items.length; i++) {
      var data = items[i];

      double lat = items[i].lat;
      double lon = items[i].lon;

      String location = "${items[i].title}, ${items[i].desc}";

      setState(() {
        markers.add(Marker(
            infoWindow: InfoWindow(
              title: items[i].title,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(wisata: data)));
              },
            ),
            markerId: MarkerId('$i'),
            position: LatLng(lat, lon),
            icon: BitmapDescriptor.defaultMarker));
      });
    }
    return markers;
  }
}
