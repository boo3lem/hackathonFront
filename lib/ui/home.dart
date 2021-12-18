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
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
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
        width: 50.0,
        height: 50.0,
        point: latLng.LatLng(36.735500001051355, 3.153200021802757),
        builder: (ctx) => InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          child: Image.asset('assets/location-pin.png'),
        ),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: latLng.LatLng(36.734950681051355, 3.153980621802757),
        builder: (ctx) => InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          child: Icon(Icons.my_location, color: Colors.red[400]!,size: 30,),
        ),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: latLng.LatLng(36.735270681051355, 3.154195621802757),
        builder: (ctx) => InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            print('hello world');
          },
          child: Image.asset('assets/location.png'),
        ),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: latLng.LatLng(36.735740681051355, 3.152705621802757),
        builder: (ctx) => InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FlagPage(Pavion(2, "", 2, 1))),
            );
          },
          child: Image.asset('assets/location.png'),
        ),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: latLng.LatLng(36.734720681051355, 3.154055621802757),
        builder: (ctx) => InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            print('hello world');
          },
          child: Image.asset('assets/location.png'),
        ),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: latLng.LatLng(36.734850681051355, 3.155555621802757),
        builder: (ctx) => InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            print('hello world');
          },
          child: Image.asset('assets/location.png'),
        ),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: latLng.LatLng(36.735930681051355, 3.155105621802757),
        builder: (ctx) => InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            print('hello world');
          },
          child: Image.asset('assets/location.png'),
        ),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: latLng.LatLng(36.735380681051355, 3.155405621802757),
        builder: (ctx) => InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            print('hello world');
          },
          child: Image.asset('assets/location.png'),
        ),
      ),
    ];
  }
}
