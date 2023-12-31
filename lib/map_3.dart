import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapstry extends StatefulWidget {
  const Mapstry({super.key});
  @override
  _MapstryState createState() => _MapstryState();
}

class _MapstryState extends State<Mapstry> {
  late GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late Position position;

  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        infoWindow: InfoWindow(snippet: 'Address'));
    setState(() {
      markers[markerId] = _marker;
    });
  }

  void getCurrentLocation() async{
    Position currentPosition = await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      position = currentPosition;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 600.0,
              child: GoogleMap(
                onTap: (tapped) async{
                  getMarkers(tapped.latitude, tapped.longitude);
                },
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      googleMapController = controller;
                    });
                  },
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(13.6217753, 123.1948238), zoom: 15.0),
                  markers: Set<Marker>.of(markers.values)),
            ),
          ],
        ),
      ),
    );
  }
}
