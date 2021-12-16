// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'repositories/place_dao.dart';
import 'models/place.dart';
import 'repositories/terminal_dao.dart';
import 'models/terminal.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Place, Terminal])
abstract class AppDatabase extends FloorDatabase {
  PlaceDao get placeDao;
  TerminalDao get terminalDao;
}