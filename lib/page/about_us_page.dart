import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});

  final _controller = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _controller,
        options: MapOptions(
            initialCenter: LatLng(47.206326291300535, -1.5394707197070925),
            initialZoom: 19),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          const MarkerLayer(markers: [
            Marker(
                alignment: Alignment.center,
                point: LatLng(47.206326291300535, -1.5394707197070925),
                child: Icon(
                  Icons.school,
                  color: Colors.black,
                  size: 64,
                ))
          ])
        ],
      ),
    );
  }
}
