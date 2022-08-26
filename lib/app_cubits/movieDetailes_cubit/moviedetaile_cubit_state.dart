part of 'moviedetaile_cubit_cubit.dart';

@immutable
abstract class MoviedetaileCubitState {}

class MoviedetaileCubitInitial extends MoviedetaileCubitState {}

class GetMovieDetailsLoadingState extends MoviedetaileCubitState {}

class GetMovieDetailsSuccesState extends MoviedetaileCubitState {
  final MovieDetail movieDetail;

  GetMovieDetailsSuccesState(this.movieDetail);
}

class GetMovieCastLoadingState extends MoviedetaileCubitState {}

class GetMovieCastSuccesState extends MoviedetaileCubitState {
  final List<Cast> movieCast;

  GetMovieCastSuccesState(this.movieCast);
}

class GetSimilarMoviesSuccesState extends MoviedetaileCubitState {
  final List<Movie> movies;

  GetSimilarMoviesSuccesState(this.movies);
}

class GetMoviesIdDatabaseSuccess extends MoviedetaileCubitState {
  GetMoviesIdDatabaseSuccess();
}

class ChangeWatchListIcon extends MoviedetaileCubitState {}
