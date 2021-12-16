import 'dart:ffi';

import 'package:floor/floor.dart';

@entity
class Terminal{
  @primaryKey
  final int id;
  final double lant;
  final double lang;
  final String title;

  Terminal(this.id, this.lant, this.lang, this.title);

}