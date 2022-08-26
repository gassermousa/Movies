// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:movies_/presentation/components/widgets/genre_movies.dart';
import 'package:movies_/presentation/components/widgets/now_playing.dart';
import 'package:movies_/presentation/components/widgets/popular_movies.dart';
import 'package:movies_/presentation/components/widgets/top_rated.dart';
import 'package:movies_/presentation/components/widgets/upComingWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectMoviesScreen extends StatelessWidget {
  final int? value;
  const SelectMoviesScreen({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UpComingMovies(value: value),
            //   GenreMovies(),
            SizedBox(
              height: 10.0.h,
            ),
            NowPlayingMovies(
              value: value,
            ),
            SizedBox(
              height: 10.0.h,
            ),
            TopRatedMovies(value: value),
            SizedBox(
              height: 10.0.h,
            ),
            PopularMovies(value: value),
            SizedBox(
              height: 40.0.h,
            ),
          ],
        ),
      )),
    );
  }
}
