import 'package:transparent_image/transparent_image.dart';

class Movie {
  int? id;
  num? popularity;
  String? title;
  String? backPoster;
  String? poster;
  String? overview;
  num? rating;
  String? releaseDate;
  List<dynamic>? genres;

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    popularity = json['popularity'] ?? 0;
    title = json['title'] ?? '';
    backPoster = json['backdrop_path'] ?? '';
    poster = json['poster_path'];
    overview = json['overview'] ?? '';
    rating = json['vote_average'] ?? 0.0;
    releaseDate = json['release_date'] ?? '';
    genres = json["genre_ids"];
  }
}
