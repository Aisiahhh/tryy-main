import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(13.6217753, 123.1948238);
  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  Set<Marker> markers = Set<Marker>();
  LatLng? _selectedLatLng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Managing'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15,
        ),
        zoomControlsEnabled: false,
        markers: markers,
        onTap: (LatLng latLng){
          _addMarker(latLng);
          setState(() {
            _selectedLatLng = latLng;
          });
        },
      ),
      
      floatingActionButton: _selectedLatLng !=null? 
      FloatingActionButton(
        onPressed: (){
          print("Selected LatLng: ${_selectedLatLng!.latitude}, ${_selectedLatLng!.longitude}");
        },
        child: const Icon(Icons.location_on),
      )
      : null,
    );
    
  }
  void _addMarker(LatLng location) {
    setState(() {
      markers = <Marker>{
        Marker(
          markerId: MarkerId('selected-location'),
          position: location,
          draggable: true,
        ),
      };
    });
  }
}
