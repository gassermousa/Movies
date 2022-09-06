import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';
import 'package:movies_/cach_helper/cach_helper.dart';
import 'package:movies_/data/model/genre_model.dart';
import 'package:movies_/data/repository/repository.dart';
import '../../data/model/movie_model.dart';
import '../../presentation/screens/2knight_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/watchlist_screen.dart';

class AppCubit extends Cubit<AppStates> {
  final MovieRepository movieRepository;
  AppCubit(this.movieRepository) : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [HomeScreen(), KnightScreen(), WatchListScreen()];

  List<String> titles = ['Home', '2Knight', 'WatchList'];

  void changeBottomNav(int index, context) {
    print('lol' + index.toString());
    currentIndex = index;
    emit(ChangeBottomNavBarState());

    if (index != 0) {
      moviesByGenre = [];
      selected = null;
    }
    if (index != 1) {
      similarMoviesSelctedMergeSet = [];
      movie1 = null;
      movie2 = null;
    }
    if (index == 2) {
      getMoviesWatchLater();
    }
  }

  bool isDark = true;
  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeMode());
    } else {
      isDark = !isDark;
      CacheHelper.savedata(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeMode());
      });
    }
  }

  late List<Movie> nowPlayingMovies = [];
  List<Movie> getNowPlayingMovies() {
    movieRepository.getNowPlayingMovies().then((value) {
      emit(GetNowPlayingMoviesSuccesState(value));
      nowPlayingMovies = value;
      print('now' + nowPlayingMovies.length.toString());
    });
    return nowPlayingMovies;
  }

  late List<Movie> upComingMovies = [];
  List<Movie> getUpComingMovies() {
    movieRepository.getUpComingMovies().then((value) {
      emit(GetUpComingMoviesMoviesSuccesState(value));
      upComingMovies = value;
    });
    return upComingMovies;
  }

  late List<Movie> topRatedMovies = [];
  List<Movie> getTopRatedMovies() {
    emit(GetTopRatedMoviesMoviesLoadingState());
    movieRepository.getTopRatedMovies().then((value) {
      emit(GetTopRatedMoviesMoviesSuccesState(value));
      topRatedMovies = value;

      print(topRatedMovies.first.overview.toString() + 'toprated');
    });
    return topRatedMovies;
  }

  late List<Movie> popularMovies = [];
  List<Movie> getPopularMovies() {
    emit(GetpopularMoviesMoviesLoadingState());
    movieRepository.getPopularMovies().then((value) {
      emit(GetpopularMoviesSuccesState(value));
      popularMovies = value;
      print('popular');
    });
    return popularMovies;
  }

  late List<Genre> generes = [];
  List<Genre> getAllGenres() {
    generes = [];
    movieRepository.getAllGenres().then((value) {
      emit(GetAllGenersSuccesState(value));
      generes = value;
      print('generes' + generes.length.toString());
    });
    return generes;
  }

  late List<Movie> moviesByGenre = [];
  List<Movie> getMoviesByGenre(int id) {
    print('object');
    movieRepository.getMoviesByGener(id).then((value) {
      emit(GetGenerMoviesSuccesState(value));
      moviesByGenre = value;
      print(moviesByGenre.first.title);
    });
    return moviesByGenre;
  }

  late List<Movie> filtredMovie = [];
  void getMovie7oda(String name) {
    filtredMovie = popularMovies
        .where((element) => element.genres!.contains(name))
        .toList();
  }

  int? selected;
  void changeSelection(int value) {
    selected = value;
    emit(ChangeSelection());
  }

  Movie? movie1;
  Movie? movie2;

  late List<Movie> similarMoviesSelcted1 = [];
  late List<Movie> similarMoviesSelcted2 = [];
  List<Movie> getSimilarMoviesSelectedItem1(int id) {
    movieRepository.getSimilarMovies(id).then((value) {
      emit(GetSimilarMoviesSelectedSuccesState(value));
      print('kkkkkk' + value.length.toString());
      similarMoviesSelcted1 = value;
    });
    return similarMoviesSelcted1;
  }

  List<Movie> getSimilarMoviesSelectedItem2(int id) {
    movieRepository.getSimilarMovies(id).then((value) {
      emit(GetSimilarMoviesSelectedSuccesState(value));
      print('kkkkkk' + value.length.toString());
      similarMoviesSelcted2 = value;
    });
    return similarMoviesSelcted2;
  }

  late List<Movie> similarMoviesSelctedMergeSet = [];
  void toSetLists() {
    if (similarMoviesSelcted1.isNotEmpty && similarMoviesSelcted2.isNotEmpty) {
      similarMoviesSelctedMergeSet = [];
      similarMoviesSelctedMergeSet =
          similarMoviesSelcted1 + similarMoviesSelcted2;
      similarMoviesSelctedMergeSet =
          similarMoviesSelctedMergeSet.toSet().toList();
      emit(MergeTwoListsSuccesState());
      print(similarMoviesSelctedMergeSet.length);
    }
  }

  ////////////Search////////////////////////////
  late List<Movie> allMoviesLists = [];
  void mergeAllMoviesLists() {
    allMoviesLists =
        popularMovies + topRatedMovies + upComingMovies + nowPlayingMovies;
  }

  late List<Movie> searchedMovieList = [];
  void searchMovie(String searchedMovie) {
    searchedMovieList = allMoviesLists
        .where((movie) =>
            movie.title!.toLowerCase().contains(searchedMovie.toLowerCase()))
        .toList();
  }

  //////////////////////////////////////
  ///
  ///
  ///sdda
  void createDatabase() {
    print('create');
    movieRepository.createDatabase();
    emit(CreateDatabaseSuccess());
  }

  void insertToDatabase(
      {required int movieID,
      required String title,
      required String poster,
      required String rating}) {
    movieRepository.insertToDatebase(movieID, title, poster, rating);
    emit(InsertToDatabaseSuccess());
  }

  List<Map> movies = [];

  void getMoviesWatchLater() {
    movies = [];
    movieRepository.getMoviesWatchLater().then((value) {
      value.forEach((element) {
        movies.add(element);
      });
      print('goooooooooooood' + movies.length.toString());
      emit(GetMoviesDatabaseSuccess(movies));
    });
  }

  void deleteMovie(int id) {
    movieRepository.deleteMovie(id);
    getMoviesWatchLater();
    emit(DeleteMovieSuccess());
  }

  late List<Movie> moviesByName = [];
  List<Movie> getMoviesByName(String name) {
    print('object');
    movieRepository.getMoviesByName(name).then((value) {
      emit(GetMovieByNameSuccesState(value));
      moviesByName = value;
    });
    return moviesByGenre;
  }

  int oldquery = 0;
  var movieID;
}
