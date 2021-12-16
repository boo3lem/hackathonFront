import 'package:floor/floor.dart';
import 'package:hackathon/data/models/terminal.dart';

@dao
abstract class TerminalDao {
  @Query('SELECT * FROM Terminal')
  Future<List<Terminal>> findAllPlaces();

  @Query('SELECT * FROM Terminal WHERE id = :id')
  Stream<Terminal?> findPlaceById(int id);

  @insert
  Future<void> insertPlace(Terminal terminal);

}