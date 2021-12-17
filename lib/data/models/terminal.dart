import 'dart:ffi';

import 'package:floor/floor.dart';

@entity
class Terminal{
  @primaryKey
  final int id;
  final double lat;
  final double lng;
  final String title;

  Terminal(this.id, this.lat, this.lng, this.title);

}