import 'package:flutter/cupertino.dart';

String? uId;
bool? isDark;
int? lengthPosts;
String apiKey = '0fdac6bf970a0b51da38f7483c6a574e';
String baseUrl = 'https://api.themoviedb.org/3/';
String upComing = 'upcoming';
String topRated = 'top_rated';
String popular = 'popular';
String credits = 'credits';
String nowPlaying = 'now_playing';
String similarMovies = 'similar';

void scrollLeft(ScrollController _controller) {
  if (_controller.hasClients) {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
