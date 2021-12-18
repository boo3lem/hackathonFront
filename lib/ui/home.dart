import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hackathon/data/data-helper.dart';
import 'package:hackathon/data/database.dart';
import 'package:hackathon/data/models/exposant.dart';
import 'package:hackathon/data/models/pavion.dart';
import 'package:hackathon/data/repositories/pavion_dao.dart';
import 'package:hackathon/ui/flag.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Marker> markers = [];
  List<Exposant> exposants = DataHelper.getStands();
  List<Exposant> searchRes = DataHelper.getStands();

  @override
  void initState() {
    // TODO: implement initState
    _loadMarkers();
    super.initState();
  }

  Future<void> insertData() async {
    AppDatabase? database = await AppDatabase.getInstance();
    final exposantDao = await database!.exposantDao;
    final expo1 = Exposant(
        1,
        "SNTF",
        "La Société nationale des transports ferroviaires (SNTF) est la société nationale des transports ferroviaires algériens, elle est créée en 1976, elle est notamment présente dans les domaines du transport de voyageurs, du transport de marchandises et réalise la gestion, l'exploitation et la maintenance du réseau ferré national dont elle est propriétaire.\nPar son volume d'activité et la taille de son réseau, la SNTF est la deuxième entreprise ferroviaire d'Afrique après les chemins de fer sud-africains.",
        "sntf.dz",
        "assets/sntf.png");
    final expo2 = Exposant(
        2,
        "Hamoud Boualem",
        "Hamoud Boualem, est une marque et une entreprise algérienne fabriquant diverses boissons, du sirop au soda. C'est une entreprise familiale, fondée en 1878 à Alger par Youssef Hamoud. Les boissons Hamoud Boualem sont consommées en Algérie, mais aussi en France, en Angleterre et au Canada.",
        "condor.dz",
        "assets/hamoud-boualam.png");

    //await exposantDao.insertExposant(expo1);
    //await exposantDao.insertExposant(expo2);

    List<Exposant> exposants = await exposantDao.findAllExposants();
    for (Exposant exposant in exposants) {
      print('\n>>>  ' + exposant.title + '  <<<\n');
    }
  }

  Widget buildFloatingSearchBar() {
    FloatingSearchBarController _FSBController = FloatingSearchBarController();
    return FloatingSearchBar(
      hint: 'Search...',
      controller: _FSBController,
      borderRadius: BorderRadius.circular(25.0),
      scrollPadding: const EdgeInsets.only(top: 10, bottom: 56),
      margins: EdgeInsets.only(top: 10.0, left: 10.0),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      automaticallyImplyBackButton: true,
      physics: const BouncingScrollPhysics(),
      axisAlignment: -1.0,
      openAxisAlignment: -1.0,
      width: 400,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) async {
        // Call your model, bloc, controller here.
        searchRes = [];
        for (Exposant exposant in exposants) {
          if (exposant.title
              .toLowerCase()
              .contains(_FSBController.query.toString().toLowerCase())) {
            searchRes.add(exposant);
          }
        }
        setState(() {});
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: SlideFadeFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child:
                Column(mainAxisSize: MainAxisSize.min, children: getChildren()),
          ),
        );
      },
    );
  }

  getChildren() {
    List<Widget> widgets = [];
    for (Exposant exposant in searchRes) {
      widgets.add(InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FlagPage(),
            ),
          );
        },
        child: Ink(
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  exposant.logo,
                  width: 50,
                ),
              ),
              Text(exposant.title),
            ],
          ),
        ),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    insertData();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FlutterMap(
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
          buildFloatingSearchBar(),
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
          child: Icon(
            Icons.my_location,
            color: Colors.red[400]!,
            size: 30,
          ),
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
                builder: (context) => FlagPage(),
              ),
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
            ),
            child: Image.asset('assets/location.png'),
          ),
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
