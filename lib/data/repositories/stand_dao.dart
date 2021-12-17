import 'package:floor/floor.dart';
import 'package:hackathon/data/models/stand.dart';

@dao
abstract class StandDao {
  @Query('SELECT * FROM Stand')
  Future<List<Stand>> findAllStands();

  @Query('SELECT * FROM Stand WHERE id = :id')
  Future<Stand?> findStandById(int id);

  @insert
  Future<void> insertStand(Stand stand);

}