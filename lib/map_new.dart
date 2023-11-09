import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a Location'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(13.6217753, 123.1948238), // Initial map location (Naga City).
          zoom: 15.0,
        ),
        markers: markers,
        onTap: _addMarker,

        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic here to save the selected location.
          // For example, you can pass the selected location (markers) to another screen or function.
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void _addMarker(LatLng location) {
    setState(() {
      markers = <Marker>{
        Marker(
          markerId: MarkerId('selected-location'),
          position: location,
        ),
      };
    });
  }
}
