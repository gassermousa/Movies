import 'package:movies_/data/constant/constant.dart';
import 'package:dio/dio.dart';
import 'package:movies_/network/remote/dio_helper.dart';
import '../model/movie_model.dart';

class ApiSrevices {
  Future<List<dynamic>> getNowPlayingMovies() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };
    try {
      Response response =
          await DioHelper.getdata(url: 'movie/$nowPlaying', query: params);

      return response.data['results'];
    } catch (e) {
      print(e.toString());

      return [];
    }
  }

  Future<List<dynamic>> getUpComingMovies() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };
    try {
      Response response =
          await DioHelper.getdata(url: 'movie/$upComing', query: params);

      return response.data['results'];
    } catch (e) {
      print(e.toString());

      return [];
    }
  }

  Future<List<dynamic>> getTopRatedMovies() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };
    try {
      Response response =
          await DioHelper.getdata(url: 'movie/$topRated', query: params);

      return response.data['results'];
    } catch (e) {
      print(e.toString());

      return [];
    }
  }

  Future<List<dynamic>> getPopularMovies() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };
    try {
      Response response =
          await DioHelper.getdata(url: 'movie/$popular', query: params);

      return response.data['results'];
    } catch (e) {
      print(e.toString());

      return [];
    }
  }

  Future<List<dynamic>> getAllGenres() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };
    try {
      Response response =
          await DioHelper.getdata(url: 'genre/movie/list', query: params);

      return response.data['genres'];
    } catch (e) {
      print(e.toString());

      return [];
    }
  }

  Future<List<dynamic>> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response =
          await DioHelper.getdata(url: 'discover/movie', query: params);
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<dynamic> getMovieDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};

    try {
      Response response =
          await DioHelper.getdata(url: 'movie/$id', query: params);

      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getMovieCast(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };
    try {
      Response response =
          await DioHelper.getdata(url: 'movie/$id/$credits', query: params);
      return response.data['cast'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getSimilarMovies(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await DioHelper.getdata(
          url: 'movie/$id/$similarMovies', query: params);
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
