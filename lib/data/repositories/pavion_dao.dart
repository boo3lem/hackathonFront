import 'package:floor/floor.dart';
import 'package:hackathon/data/models/pavion.dart';

@dao
abstract class PavionDao {
  @Query('SELECT * FROM Pavion')
  Future<List<Pavion>> findAllPavions();

  @Query('SELECT * FROM Pavion WHERE id = :id')
  Stream<Pavion?> findPavionById(int id);

  @insert
  Future<void> insertPavion(Pavion pavion);

}