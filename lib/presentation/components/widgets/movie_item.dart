import 'package:flutter/material.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/movieDetailes_cubit/moviedetaile_cubit_cubit.dart';
import 'package:movies_/data/model/movie_model.dart';
import 'package:movies_/presentation/components/colors.dart';
import 'package:movies_/presentation/components/navigator.dart';
import 'package:movies_/presentation/screens/movie_details_screen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget buildMovieItem(Movie movie, context, index, {int? value}) => Column(
      children: <Widget>[
        BlocBuilder<MoviedetaileCubitCubit, MoviedetaileCubitState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                MoviedetaileCubitCubit.get(context).getMoviesID(movie.id!);
                MoviedetaileCubitCubit.get(context).moviesDetailes = null;
                MoviedetaileCubitCubit.get(context).castMovie = [];
                if (value == null) {
                  navigateTo(
                      context,
                      MovieDetailsScreen(
                        movieId: movie.id,
                      ));
                  MoviedetaileCubitCubit.get(context)
                      .getMoviesDetailes(movie.id!);
                } else {
                  if (value == 1) {
                    AppCubit.get(context).movie1 = movie;
                    AppCubit.get(context)
                        .getSimilarMoviesSelectedItem1(movie.id!);
                    Navigator.pop(context);
                  }

                  if (value == 2) {
                    AppCubit.get(context).movie2 = movie;
                    AppCubit.get(context)
                        .getSimilarMoviesSelectedItem2(movie.id!);
                    Navigator.pop(context);
                  }
                }
              },
              child: Stack(
                children: <Widget>[
                  Shimmer.fromColors(
                    baseColor: Colors.black87,
                    highlightColor: Colors.white54,
                    enabled: true,
                    child: SizedBox(
                      height: 160.0.h,
                      child: AspectRatio(
                          aspectRatio: 2 / 3.sp,
                          child: Icon(
                            FontAwesome5.film,
                            color: Colors.black26,
                            size: 40.0.sp,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 160.0.h,
                    child: AspectRatio(
                        aspectRatio: 2 / 3.sp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0.r),
                          child: movie.poster == null
                              ? Image.asset('assets/image/film.png')
                              : FadeInImage.memoryNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: kTransparentImage,
                                  image: 'https://image.tmdb.org/t/p/w300' +
                                      movie.poster!),
                        )),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.0.w,
                child: AutoSizeText(
                  movie.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      height: 1.0.h,
                      color: Colors.white,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                              fontSize: 16.0.sp, fontWeight: FontWeight.bold)
                          .fontSize),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    AutoSizeText(
                      movie.rating!.toStringAsPrecision(2).toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.bold)
                              .fontSize),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Icon(
                      Icons.star,
                      color: ratingColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
