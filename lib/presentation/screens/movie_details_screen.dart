import 'package:flutter/material.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';

import 'package:movies_/app_cubits/movieDetailes_cubit/moviedetaile_cubit_cubit.dart';
import 'package:movies_/data/model/movie_details_model.dart';
import 'package:movies_/data/model/movie_model.dart';
import 'package:movies_/presentation/components/widgets/cast_list.dart';
import 'package:movies_/presentation/components/widgets/movie_item.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:auto_size_text/auto_size_text.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int? movieId;
  MovieDetailsScreen({Key? key, this.movieId}) : super(key: key);
  MovieDetail? movie;
  List<Movie>? movies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<MoviedetaileCubitCubit, MoviedetaileCubitState>(
          builder: (context, state) {
            int indexScreen = AppCubit.get(context).currentIndex;
            if (MoviedetaileCubitCubit.get(context).moviesDetailes != null &&
                MoviedetaileCubitCubit.get(context).castMovie.isNotEmpty) {
              movie = MoviedetaileCubitCubit.get(context).moviesDetailes;
              movies = MoviedetaileCubitCubit.get(context).similarMovies;
              return Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width.w,
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.white54,
                              child: AspectRatio(
                                  aspectRatio: 3 / 2.sp,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                    color: Colors.black12,
                                  ))),
                            ),
                            AspectRatio(
                                aspectRatio: 3 / 2.sp,
                                child: FadeInImage.memoryNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: kTransparentImage,
                                    image: movie!.backPoster)),
                          ],
                        ),
                        AspectRatio(
                          aspectRatio: 3 / 2.sp,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.2),
                                  Colors.black.withOpacity(1.0)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0, 1],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0.0.h,
                            left: 10.0.w,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width.w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Colors.white10,
                                        highlightColor: Colors.white30,
                                        enabled: true,
                                        child: SizedBox(
                                          height: 120.0.h,
                                          child: AspectRatio(
                                              aspectRatio: 2 / 3.sp,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: Colors.black12,
                                              ))),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        height: 120.0.h,
                                        child: AspectRatio(
                                            aspectRatio: 2 / 3,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: FadeInImage.memoryNetwork(
                                                  placeholder:
                                                      kTransparentImage,
                                                  image: movie!.poster),
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.0.w,
                                  ),
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width -
                                            140)
                                        .w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AutoSizeText(
                                          MoviedetaileCubitCubit.get(context)
                                              .moviesDetailes!
                                              .title,
                                          style: TextStyle(
                                              fontSize: 18.0.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AutoSizeText(
                                              "Release date: " +
                                                  movie!.releaseDate,
                                              style: TextStyle(
                                                color: Colors.white60,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  BlocBuilder<AppCubit, AppStates>(
                                    builder: (context, state) {
                                      return IconButton(
                                          onPressed: () {
                                            AppCubit.get(context)
                                                .insertToDatabase(
                                                    movieID: movie!.id,
                                                    title: movie!.title,
                                                    poster: movie!.poster,
                                                    rating: movie!.rating
                                                        .toString());
                                            MoviedetaileCubitCubit.get(context)
                                                .changeWatchList();
                                          },
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: MoviedetaileCubitCubit.get(
                                                        context)
                                                    .isWatchlist
                                                ? Colors.red
                                                : Colors.white,
                                          ));
                                    },
                                  )
                                ],
                              ),
                            )),
                        Positioned(
                          left: 5.0.w,
                          child: SafeArea(
                              child: IconButton(
                                  onPressed: () {
                                    movie = null;
                                    MoviedetaileCubitCubit.get(context)
                                        .moviesDetailes = null;
                                    MoviedetaileCubitCubit.get(context)
                                        .castMovie = [];
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 25.0.sp,
                                  ))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 25.0.sp,
                            ),
                            SizedBox(
                              width: 5.0.w,
                            ),
                            Text(
                              getDuration(movie!.runtime),
                              style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10.0.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 40.0.h,
                                padding: EdgeInsets.only(right: 10.0.w),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: MoviedetaileCubitCubit.get(context)
                                      .moviesDetailes!
                                      .genres
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 5.0.w),
                                      child: Center(
                                        child: Container(
                                          padding: EdgeInsets.all(8.0.sp),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0.sp)),
                                              color: Colors.white
                                                  .withOpacity(0.1)),
                                          child: AutoSizeText(
                                            movie!.genres[index].name!,
                                            maxLines: 2,
                                            style: TextStyle(
                                              height: 1.4.h,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0.h,
                        ),
                        AutoSizeText("OVERVIEW",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0.sp,
                                color: Colors.white.withOpacity(0.5))),
                        const SizedBox(
                          height: 10.0,
                        ),
                        AutoSizeText(movie!.overview,
                            style: TextStyle(
                                height: 1.5.h,
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.05)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CASTS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.white.withOpacity(0.5))),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CastList(
                          casts: MoviedetaileCubitCubit.get(context).castMovie,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.05)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText("Similar Movies",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0.sp,
                                color: Colors.white.withOpacity(0.5))),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 240.h,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return buildMovieItem(
                                    movies![index], context, indexScreen);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 10.0.w,
                                );
                              },
                              itemCount: movies!.length),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  String getDuration(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}min';
  }
}
