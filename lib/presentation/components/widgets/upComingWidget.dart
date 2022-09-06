import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';
import 'package:movies_/app_cubits/movieDetailes_cubit/moviedetaile_cubit_cubit.dart';
import 'package:movies_/data/model/movie_details_model.dart';
import 'package:movies_/data/model/movie_model.dart';
import 'package:movies_/presentation/components/colors.dart';
import 'package:movies_/presentation/components/navigator.dart';
import 'package:movies_/presentation/components/widgets/title_list_movies.dart';
import 'package:movies_/presentation/screens/2knight_screen.dart';
import 'package:movies_/presentation/screens/movie_details_screen.dart';

import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:transparent_image/transparent_image.dart';

class UpComingMovies extends StatelessWidget {
  final int? value;
  const UpComingMovies({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Movie> movies = [];

    MovieDetail movie;
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        int indexScreen = AppCubit.get(context).currentIndex;
        if (AppCubit.get(context).upComingMovies.isNotEmpty) {
          movies = AppCubit.get(context).upComingMovies;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeadTitleMovies(
                title: 'Upcoming Movies',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 550.h,
              child: PageIndicatorContainer(
                indicatorSelectorColor: defaultColor,
                length: movies.take(5).length,
                align: IndicatorAlign.bottom,
                padding: EdgeInsets.all(8),
                indicatorSpace: 8,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.take(5).length,
                  itemBuilder: (context, index) {
                    return BlocBuilder<MoviedetaileCubitCubit,
                        MoviedetaileCubitState>(
                      builder: (context, state) {
                        return InkWell(
                          onTap: () async {
                            if (indexScreen == 0) {
                              navigateTo(
                                  context,
                                  MovieDetailsScreen(
                                    movieId: movies[index].id!,
                                  ));
                              MoviedetaileCubitCubit.get(context)
                                  .getMoviesID(movies[index].id!);
                              MoviedetaileCubitCubit.get(context)
                                  .getMoviesDetailes(movies[index].id!);
                            } else {
                              if (value == 1) {
                                AppCubit.get(context).movie1 = movies[index];
                                AppCubit.get(context)
                                    .getSimilarMoviesSelectedItem1(
                                        movies[index].id!);
                                Navigator.pop(context);
                              }

                              if (value == 2) {
                                AppCubit.get(context).movie2 = movies[index];
                                AppCubit.get(context)
                                    .getSimilarMoviesSelectedItem2(
                                        movies[index].id!);
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: StackShimmer(movies: movies[index]),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class StackShimmer extends StatelessWidget {
  const StackShimmer({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final Movie movies;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.black87,
          highlightColor: Colors.white54,
          enabled: true,
          child: AspectRatio(
              aspectRatio: (2 / 2.8).sp,
              child: Icon(
                FontAwesome5.film,
                color: Colors.black26,
                size: 40.0.sp,
              )),
        ),
        Container(
          width: MediaQuery.of(context).size.width.h,
          height: 700.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: DecorationImage(
                      image: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://image.tmdb.org/t/p/w300' + movies.poster!,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ).image)
                  .image,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  darkModeColor.withOpacity(1.0),
                  darkModeColor.withOpacity(0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.0, 0.9]),
          ),
        ),
        Positioned(
            bottom: 30.0.h,
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Text(
                movies.title!,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
      ],
    );
  }
}
