import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationView extends StatefulWidget {
  const PickLocationView({Key? key}) : super(key: key);

  @override
  State<PickLocationView> createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  final companyLocation = const LatLng(31.0226726, 31.3878685);
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers,
        onTap: (location) {
          debugPrint(location.latitude.toString());
          debugPrint(location.longitude.toString());
          markers.add(Marker(markerId: const MarkerId("1"), position: location));
          setState(() {});
        },
        initialCameraPosition: CameraPosition(
          target: companyLocation,
          zoom: 18,
        ),
      ),
    );
  }
}
