import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/data/database.dart';
import 'package:hackathon/data/models/pavion.dart';
import 'package:hackathon/data/repositories/pavion_dao.dart';

import 'package:hackathon/sidebar/sidebar_layout.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'data/models/exposant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase? database = await AppDatabase.getInstance();
  PavionDao pavionDao = database!.pavionDao;
  List<Pavion> pavions = await pavionDao.findAllPavions();
  if (pavions == null || pavions.length == 0) {
    pavionDao
        .insertPavion(Pavion(1, "PV1", 36.735270681051355, 3.154195621802757));
    pavionDao
        .insertPavion(Pavion(2, "PV2", 36.735740681051355, 3.152705621802757));
    pavionDao
        .insertPavion(Pavion(3, "PV3", 36.734720681051355, 3.154055621802757));
    pavionDao
        .insertPavion(Pavion(4, "PV4", 36.734850681051355, 3.155555621802757));
    pavionDao
        .insertPavion(Pavion(5, "PV5", 36.735930681051355, 3.155105621802757));
    pavionDao
        .insertPavion(Pavion(6, "PV6", 36.735380681051355, 3.155405621802757));
    print('Inserted');
  }
  print('Already Inserted');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: SideBarLayout(),
    );
  }
}
