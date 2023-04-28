import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key}) : super(key: key);

  @override
  GoogleMapsPageState createState() => GoogleMapsPageState();
}

class GoogleMapsPageState extends State<GoogleMapsPage>{

  static CameraPosition get _kGooglePlex => const CameraPosition(
    target: LatLng(28.496172756691475, 77.08313455071222),
    zoom:17,
  );

  List<Marker> marker = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(28.496172756691475, 77.08313455071222),
      infoWindow: InfoWindow(
        title: "My office"
      )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Map Page'),
        ),
        body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationEnabled: true,
          trafficEnabled: true,

          markers: Set<Marker>.of(marker),


        )
    );
  }

}