import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hackathon/data/database.dart';
import 'package:hackathon/data/models/pavion.dart';
import 'package:hackathon/data/repositories/pavion_dao.dart';
import 'package:hackathon/ui/flag.dart';
import "package:latlong2/latlong.dart" as latLng;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Marker> markers = [];

  @override
  void initState() {
    // TODO: implement initState
    _loadMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(36.735270681051355, 3.154195621802757),
          zoom: 18.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: _loadMarkers(),
          ),
        ],
      ),
    );
  }

  _loadMarkers() {
    return [
      Marker(
        width: 40.0,
        height: 40.0,
        point: latLng.LatLng(36.735270681051355, 3.154195621802757),
        builder: (ctx) => Material(
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "P1",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: latLng.LatLng(36.735740681051355, 3.152705621802757),
        builder: (ctx) => Material(
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FlagPage(Pavion(1, "", 12, 12))),
              );
            },
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "P2",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: latLng.LatLng(36.734720681051355, 3.154055621802757),
        builder: (ctx) => Material(
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "P3",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: latLng.LatLng(36.734850681051355, 3.155555621802757),
        builder: (ctx) => Material(
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                  child: Text(
                "P4",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w800),
              )),
            ),
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: latLng.LatLng(36.735930681051355, 3.155105621802757),
        builder: (ctx) => Material(
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "P5",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: latLng.LatLng(36.735380681051355, 3.155405621802757),
        builder: (ctx) => Material(
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "P6",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
