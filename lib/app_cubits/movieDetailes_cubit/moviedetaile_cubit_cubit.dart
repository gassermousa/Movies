import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_/data/model/cast.dart';
import 'package:movies_/data/model/movie_details_model.dart';
import 'package:movies_/data/model/movie_model.dart';
import 'package:movies_/data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'moviedetaile_cubit_state.dart';

class MoviedetaileCubitCubit extends Cubit<MoviedetaileCubitState> {
  final MovieRepository movieRepository;
  MoviedetaileCubitCubit(this.movieRepository)
      : super(MoviedetaileCubitInitial());

  static MoviedetaileCubitCubit get(context) => BlocProvider.of(context);
  MovieDetail? moviesDetailes;
  MovieDetail getMoviesDetailes(int id) {
    moviesDetailes == null;
    emit(GetMovieDetailsLoadingState());
    movieRepository.getMoviesDitailes(id).then((value) {
      moviesDetailes = value;
      getMovieCast(id);
      getSimilarMovies(id);
      emit(GetMovieDetailsSuccesState(value));
    });
    emit(GetMovieDetailsSuccesState(moviesDetailes!));
    return moviesDetailes!;
  }

  late List<Cast> castMovie = [];
  List<Cast> getMovieCast(int id) {
    castMovie = [];
    emit(GetMovieCastLoadingState());
    movieRepository.getMovieCast(id).then((value) {
      castMovie = value;
      print('100 ' + castMovie.length.toString());
      emit(GetMovieCastSuccesState(castMovie));
    });
    return castMovie;
  }

  late List<Movie> similarMovies = [];

  late List<Movie> similarMoviesSelcted1 = [];
  late List<Movie> similarMoviesSelcted2 = [];
  List<Movie> getSimilarMovies(int id) {
    movieRepository.getSimilarMovies(id).then((value) {
      emit(GetSimilarMoviesSuccesState(value));
      similarMovies = value;
    });
    return similarMovies;
  }

  bool isWatchlist = false;
  void changeWatchList() {
    isWatchlist = !isWatchlist;
    emit(ChangeWatchListIcon());
  }

  List<Map> moviesID = [];
  void getMoviesID(int m) {
    isWatchlist = false;

    moviesID = [];
    movieRepository.getMoviesID().then((value) {
      value.forEach((element) {
        moviesID.add(element);
      });
      print('object' + moviesID.length.toString());
      for (int i = 0; i <= moviesID.length; i++) {
        if (moviesID[i].containsValue(m)) {
          isWatchlist = true;
          print('isWatchedList');
        }
      }
      emit(GetMoviesIdDatabaseSuccess());
    });
  }

  // void checkmovieindatabase(int movieId, List<Map> moviesIDs) {
  //   print('cheeeeeeeeeeeck');
  //   print(moviesIDs.length.toString() + 'hhhhhhhhhhh');
  //   if (moviesIDs.contains(movieId)) {

  //   }
  // }
}
