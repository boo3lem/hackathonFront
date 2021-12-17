import 'package:floor/floor.dart';
import 'package:hackathon/data/models/terminal.dart';

@dao
abstract class TerminalDao {
  @Query('SELECT * FROM Terminal')
  Future<List<Terminal>> findAllPlaces();

  @Query('SELECT * FROM Terminal WHERE id = :id')
  Stream<Terminal?> findPlaceById(int id);

  @Query('SELECT * FROM Terminal WHERE title LIKE :motif')
  Future<Terminal?> findTerminalByTitle(String motif);

  @insert
  Future<void> insertPlace(Terminal terminal);

}