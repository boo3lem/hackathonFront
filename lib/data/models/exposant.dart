import 'package:floor/floor.dart';

@entity
class Exposant {
  @primaryKey
  final int id;
  final String title;
  final String description;
  final String website;
  final String logo;

  Exposant(this.id, this.title, this.description, this.website, this.logo);
  
}