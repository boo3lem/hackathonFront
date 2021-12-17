import 'dart:ffi';

import 'package:floor/floor.dart';

@entity
class Pavion{
  @primaryKey
  final int id;
  final String title;
  final double lat;
  final double lng;

  Pavion(this.id, this.title, this.lat, this.lng);
}