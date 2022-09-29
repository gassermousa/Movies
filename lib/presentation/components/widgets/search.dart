import 'package:flutter/material.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';
import 'package:movies_/app_cubits/movieDetailes_cubit/moviedetaile_cubit_cubit.dart';
import 'package:movies_/presentation/components/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_/presentation/components/divider.dart';
import 'package:movies_/presentation/components/navigator.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../screens/movie_details_screen.dart';

class Search extends SearchDelegate<String> {
  List<String> searchTerms = [];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Theme.of(context).copyWith(
        backgroundColor: darkModeColor,
        scaffoldBackgroundColor: darkModeColor,
        focusColor: darkModeColor,
        disabledColor: darkModeColor,
        inputDecorationTheme:
            theme.inputDecorationTheme.copyWith(border: UnderlineInputBorder()),
        textTheme: TextTheme(subtitle1: Theme.of(context).textTheme.subtitle1));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 15.sp, 0, 0),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 15.h,
          );
        },
        itemCount: AppCubit.get(context).moviesByName.length,
        itemBuilder: (context, index) {
          var result = AppCubit.get(context).moviesByName[index];
          return ListTile(
            onTap: () {
              query = result.title!;
              showResults(context);
              MoviedetaileCubitCubit.get(context)
                  .getMoviesID(AppCubit.get(context).moviesByName[index].id!);
              MoviedetaileCubitCubit.get(context).moviesDetailes = null;
              MoviedetaileCubitCubit.get(context).castMovie = [];

              AppCubit.get(context).getSimilarMoviesSelectedItem1(
                  AppCubit.get(context).moviesByName[index].id!);
              AppCubit.get(context).getSimilarMoviesSelectedItem2(
                  AppCubit.get(context).moviesByName[index].id!);
              AppCubit.get(context).movieID =
                  AppCubit.get(context).moviesByName[index].id!;
              navigateTo(
                  context,
                  MovieDetailsScreen(
                    movieId: AppCubit.get(context).moviesByName[index].id!,
                  ));
              query = '';
              MoviedetaileCubitCubit.get(context).getMoviesDetailes(
                AppCubit.get(context).moviesByName[index].id!,
              );
            },
            title: AutoSizeText(
              result.title!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5.0.r),
              child: AspectRatio(
                aspectRatio: 2 / 3.sp,
                child: AppCubit.get(context).moviesByName[index].poster == null
                    ? Image.asset('assets/image/film.png')
                    : FadeInImage.memoryNetwork(
                        fit: BoxFit.cover,
                        placeholder: kTransparentImage,
                        image: 'https://image.tmdb.org/t/p/w300' +
                            AppCubit.get(context).moviesByName[index].poster!,
                        height: 180.0.h),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        print(AppCubit.get(context).oldquery);
        if (query.isNotEmpty) {
          if (query.length > AppCubit.get(context).oldquery ||
              query.length < AppCubit.get(context).oldquery) {
            AppCubit.get(context).getMoviesByName(query);
            AppCubit.get(context).oldquery = query.length;
          }
        }
        if (query.isEmpty) {
          AppCubit.get(context).moviesByName = [];
          AppCubit.get(context).oldquery = 0;
        }
        return Padding(
          padding: EdgeInsets.fromLTRB(0, 15.sp, 0, 0),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemCount: AppCubit.get(context).moviesByName.length,
            itemBuilder: (context, index) {
              var result = AppCubit.get(context).moviesByName[index];
              return ListTile(
                onTap: () {
                  query = result.title!;
                  showResults(context);
                  MoviedetaileCubitCubit.get(context).getMoviesID(
                      AppCubit.get(context).moviesByName[index].id!);
                  MoviedetaileCubitCubit.get(context).moviesDetailes = null;
                  MoviedetaileCubitCubit.get(context).castMovie = [];

                  AppCubit.get(context).getSimilarMoviesSelectedItem1(
                      AppCubit.get(context).moviesByName[index].id!);
                  AppCubit.get(context).getSimilarMoviesSelectedItem2(
                      AppCubit.get(context).moviesByName[index].id!);
                  AppCubit.get(context).movieID =
                      AppCubit.get(context).moviesByName[index].id!;
                  navigateTo(
                      context,
                      MovieDetailsScreen(
                        movieId: AppCubit.get(context).moviesByName[index].id!,
                      ));
                  query = '';
                  MoviedetaileCubitCubit.get(context).getMoviesDetailes(
                    AppCubit.get(context).moviesByName[index].id!,
                  );
                },
                title: AutoSizeText(
                  result.title!,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0.r),
                  child: AspectRatio(
                    aspectRatio: 2 / 3.sp,
                    child:
                        AppCubit.get(context).moviesByName[index].poster == null
                            ? Image.asset('assets/image/film.png')
                            : FadeInImage.memoryNetwork(
                                fit: BoxFit.cover,
                                placeholder: kTransparentImage,
                                image: 'https://image.tmdb.org/t/p/w300' +
                                    AppCubit.get(context)
                                        .moviesByName[index]
                                        .poster!,
                                height: 180.0.h),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
