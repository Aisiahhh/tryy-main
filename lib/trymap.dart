import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({super.key});
  
  @override 
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  List<Marker> myMarker = [];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
          const CameraPosition(
            target: LatLng(13.6217753, 123.1948238),
            zoom: 15,
          ),
        markers: Set.from(myMarker),
        onTap: _handleTap,
      ),
    );
  }
  _handleTap(LatLng tappedPoint){
    setState((){
      myMarker = []; 
      myMarker.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          draggable: true, 
          onDragEnd: (dragEndPosition){
            print(dragEndPosition); 
          }
        )
      );
    });
  }
}