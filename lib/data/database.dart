// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'repositories/exposant_dao.dart';
import 'repositories/stand_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'models/exposant.dart';
import 'models/stand.dart';
import 'repositories/pavion_dao.dart';
import 'models/pavion.dart';
import 'repositories/terminal_dao.dart';
import 'models/terminal.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Pavion, Terminal, Exposant, Stand])
abstract class AppDatabase extends FloorDatabase {
  PavionDao get pavionDao;
  TerminalDao get terminalDao;
  ExposantDao get exposantDao;
  StandDao get standDao;

  static AppDatabase? _instance;

  static Future<AppDatabase?> getInstance() async {
    if (_instance == null) {
      _instance = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    }
    return _instance;
  }
}