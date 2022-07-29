import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_sumenep_app/constant.dart';
import 'package:http/http.dart' as http;

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  // List<Marker> marker = [];
  // List<Marker> list = const [
  // Marker(
  // markerId: MarkerId('1'),
  // position: LatLng(-6.944374, 113.775945),
  // infoWindow: InfoWindow(
  // title: 'Masjid Jami Sumenep',
  // snippet: 'Lokasi Masjid Jami Sumenep',),
  // icon: BitmapDescriptor.defaultMarker
  // ),
  // ];
//
  final Set<Marker> markers = new Set();

  List users = [];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-7.01667, 113.86667),
    zoom: 10.4746,
  );

  @override
  void initState() {
    super.initState();
    fetchState();
    // marker.addAll(list);
  }

  fetchState() async {
    print("fetch map...");
    var url = url_user;
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var items = json.decode(response.body)['results'];

      setState(() {
        users = items;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      // markers: Set<Marker>.of(marker),

      markers: getMarkers(users),
    );
  }

  Set<Marker> getMarkers(items) {
    for (int i = 0; i < users.length; i++) {
      var data = items[i];

      double lat = double.parse(data['location']['coordinates']['latitude']);
      double lon = double.parse(data['location']['coordinates']['longitude']);

      String location =
          data['location']['state'] + ", " + data['location']['country'];

      setState(() {
        markers.add(Marker(
            markerId: MarkerId('$i'),
            position: LatLng(lat, lon),
            infoWindow: InfoWindow(
              title: location,
            ),
            icon: BitmapDescriptor.defaultMarker));
      });
    }

    return markers;
  }
}
