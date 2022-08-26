import 'package:sqflite/sqflite.dart';

class MoviesDatabase {
  Database? database;

  void createDatabase() async {
    database = await openDatabase('MyMovies.db', version: 1,
        onCreate: (database, version) async {
      // When creating the db, create the table
      await database.execute(
          'CREATE TABLE Movies (id INTEGER PRIMARY KEY, movieID INTEGER , title TEXT, poster TEXT, rating TEXT)');
    }, onOpen: (database) {
      print('opned');
    });
  }

  Future insertToDatebase(
      {required int movieID,
      required String title,
      required String poster,
      required String rating}) async {
    await database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Movies(movieID,title,poster,rating) VALUES("$movieID","$title","$poster","$rating")')
          .then((value) {
        print('added!');
      }).catchError((error) {
        print('Error when to inserting New Record  ${error.toString()}');
      });
    });
  }

  Future getMoviesWatchLater() {
    return database!.rawQuery('SELECT * FROM Movies');
  }

  Future getMoviesID() {
    return database!.rawQuery('SELECT movieID FROM Movies');
  }
}
