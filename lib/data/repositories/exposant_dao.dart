import 'package:floor/floor.dart';
import 'package:hackathon/data/models/exposant.dart';

@dao
abstract class ExposantDao {
  @Query('SELECT * FROM Exposant')
  Future<List<Exposant>> findAllExposants();

  @Query('SELECT * FROM Exposant WHERE id = :id')
  Future<Exposant?> findExposantById(int id);

  @insert
  Future<void> insertExposant(Exposant exposant);

}