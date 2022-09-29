import 'package:movies_/data/model/genre_model.dart';
import 'package:movies_/data/model/movie_model.dart';

abstract class AppStates {}

class ChangeBottomNavBarState extends AppStates {}

class AppInitialStates extends AppStates {}

class AppChangeMode extends AppStates {}

class GetNowPlayingMoviesSuccesState extends AppStates {
  final List<Movie> movies;

  GetNowPlayingMoviesSuccesState(this.movies);
}

class GetUpComingMoviesMoviesSuccesState extends AppStates {
  final List<Movie> movies;

  GetUpComingMoviesMoviesSuccesState(this.movies);
}

class GetMoviesSuccesState extends AppStates {
  final List<Movie> movies;

  GetMoviesSuccesState(this.movies);
}

class GetTopRatedMoviesMoviesLoadingState extends AppStates {}

class GetTopRatedMoviesMoviesSuccesState extends AppStates {
  final List<Movie> movies;

  GetTopRatedMoviesMoviesSuccesState(this.movies);
}

class GetpopularMoviesMoviesLoadingState extends AppStates {}

class GetpopularMoviesSuccesState extends AppStates {
  final List<Movie> movies;

  GetpopularMoviesSuccesState(this.movies);
}

class GetAllGenersSuccesState extends AppStates {
  final List<Genre> genres;

  GetAllGenersSuccesState(this.genres);
}

class GetGenerMoviesSuccesState extends AppStates {
  final List<Movie> movies;

  GetGenerMoviesSuccesState(this.movies);
}

class GetSimilarMoviesSelectedSuccesState extends AppStates {
  final List<Movie> movies;

  GetSimilarMoviesSelectedSuccesState(this.movies);
}

class ChangeSelection extends AppStates {}

class MergeTwoListsSuccesState extends AppStates {}

class CreateDatabaseSuccess extends AppStates {}

class InsertToDatabaseSuccess extends AppStates {}

class GetMoviesDatabaseSuccess extends AppStates {
  final List<Map> movies;

  GetMoviesDatabaseSuccess(this.movies);
}

class GetMoviesDatabaseLoading extends AppStates {}

class DeleteMovieSuccess extends AppStates {}

class GetMovieByNameSuccesState extends AppStates {
  final List<Movie> movies;

  GetMovieByNameSuccesState(this.movies);
}
