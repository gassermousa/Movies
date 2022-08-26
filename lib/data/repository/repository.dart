import 'package:movies_/data/model/cast.dart';
import 'package:movies_/data/model/genre_model.dart';
import 'package:movies_/data/model/movie_details_model.dart';
import 'package:movies_/data/model/movie_model.dart';
import 'package:movies_/data/services/moviesDatabase.dart';
import 'package:movies_/data/services/movies_api.dart';

class MovieRepository {
  final ApiSrevices apiSrevices;
  final MoviesDatabase moviesDatabase;

  MovieRepository(this.apiSrevices, this.moviesDatabase);
  Future<List<Movie>> getNowPlayingMovies() async {
    final movies = await apiSrevices.getNowPlayingMovies();
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getUpComingMovies() async {
    final movies = await apiSrevices.getUpComingMovies();
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final movies = await apiSrevices.getTopRatedMovies();
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getPopularMovies() async {
    final movies = await apiSrevices.getPopularMovies();
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Genre>> getAllGenres() async {
    final generes = await apiSrevices.getAllGenres();
    return generes.map((genre) => Genre.fromJson(genre)).toList();
  }

  Future<List<Movie>> getMoviesByGener(int id) async {
    final movies = await apiSrevices.getMovieByGenre(id);
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<MovieDetail> getMoviesDitailes(int id) async {
    final movies = await apiSrevices.getMovieDetail(id);
    return MovieDetail.fromJson(movies);
  }

  Future<List<Cast>> getMovieCast(int id) async {
    final characters = await apiSrevices.getMovieCast(id);
    return characters.map((character) => Cast.fromJson(character)).toList();
  }

  Future<List<Movie>> getSimilarMovies(int id) async {
    final movies = await apiSrevices.getSimilarMovies(id);
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }

  void createDatabase() {
    moviesDatabase.createDatabase();
  }

  Future insertToDatebase(
      int movieID, String title, String poster, String rating) {
    return moviesDatabase.insertToDatebase(
        movieID: movieID, title: title, poster: poster, rating: rating);
  }

  Future getMoviesWatchLater() {
    return moviesDatabase.getMoviesWatchLater();
  }

  Future getMoviesID() {
    return moviesDatabase.getMoviesID();
  }
}
