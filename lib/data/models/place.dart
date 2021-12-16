import 'dart:ffi';

import 'package:floor/floor.dart';

@entity
class Place{
  @primaryKey
  final int id;
  final String title_ar;
  final String title_fr;
  final String title_en;
  final double lant;
  final double lang;
  final String description_ar;
  final String description_fr;
  final String description_en;

  Place(this.id, this.title_ar, this.title_fr, this.title_en, this.lant, this.lang, this.description_ar, this.description_fr, this.description_en);
}