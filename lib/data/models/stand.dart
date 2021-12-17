import 'package:floor/floor.dart';

@entity
class Stand {
  @primaryKey
  final int id;
  final String title;
  final int idPavion;
  final int idExposant;

  Stand(this.id, this.title, this.idPavion, this.idExposant);

}