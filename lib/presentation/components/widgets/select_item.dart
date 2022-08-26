import 'package:flutter/material.dart';
import 'package:movies_/data/model/movie_model.dart';
import 'package:movies_/presentation/components/navigator.dart';
import 'package:movies_/presentation/screens/selecte_movies_screen.dart';

import 'package:transparent_image/transparent_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class SelectMovieItem extends StatelessWidget {
  final Movie? movie;
  final int? value;

  const SelectMovieItem({Key? key, this.movie, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movie == null
        ? InkWell(
            onTap: () {
              navigateTo(
                  context,
                  SelectMoviesScreen(
                    value: value,
                  ));
            },
            child: Container(
              height: 160.0,
              width: 120.0,
              color: Colors.blue.shade50.withOpacity(0.7),
              child: Icon(Icons.add),
            ),
          )
        : Stack(
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.black87,
                highlightColor: Colors.white54,
                enabled: true,
                child: const SizedBox(
                  height: 160.0,
                  child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Icon(
                        FontAwesome5.film,
                        color: Colors.black26,
                        size: 40.0,
                      )),
                ),
              ),
              SizedBox(
                height: 160.0.h,
                child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: FadeInImage.memoryNetwork(
                          fit: BoxFit.cover,
                          placeholder: kTransparentImage,
                          image: 'https://image.tmdb.org/t/p/w300' +
                              movie!.poster!),
                    )),
              ),
            ],
          );
  }
}
