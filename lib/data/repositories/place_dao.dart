import 'package:floor/floor.dart';
import 'package:hackathon/data/models/place.dart';

@dao
abstract class PlaceDao {
  @Query('SELECT * FROM Place')
  Future<List<Place>> findAllPlaces();

  @Query('SELECT * FROM Place WHERE id = :id')
  Stream<Place?> findPlaceById(int id);

  @insert
  Future<void> insertPlace(Place place);

}