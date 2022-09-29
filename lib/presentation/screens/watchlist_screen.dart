import 'package:flutter/material.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';
import 'package:movies_/app_cubits/movieDetailes_cubit/moviedetaile_cubit_cubit.dart';
import 'package:movies_/presentation/components/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_/presentation/components/widgets/watchlist_item.dart';
import 'package:movies_/presentation/screens/movie_details_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        if (AppCubit.get(context).movies.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BlocBuilder<MoviedetaileCubitCubit,
                      MoviedetaileCubitState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          MoviedetaileCubitCubit.get(context).getMoviesID(
                              AppCubit.get(context).movies[index]['movieID']);
                          MoviedetaileCubitCubit.get(context).moviesDetailes =
                              null;
                          MoviedetaileCubitCubit.get(context).castMovie = [];

                          AppCubit.get(context).getSimilarMoviesSelectedItem1(
                              AppCubit.get(context).movies[index]['movieID']);
                          AppCubit.get(context).getSimilarMoviesSelectedItem2(
                              AppCubit.get(context).movies[index]['movieID']);
                          navigateTo(
                              context,
                              MovieDetailsScreen(
                                movieId: AppCubit.get(context).movies[index]
                                    ['movieID'],
                              ));
                          MoviedetaileCubitCubit.get(context).getMoviesDetailes(
                            AppCubit.get(context).movies[index]['movieID'],
                          );
                        },
                        child: WatchListItem(
                          poster: AppCubit.get(context).movies[index]['poster'],
                          name: AppCubit.get(context).movies[index]['title'],
                          rating: AppCubit.get(context).movies[index]['rating'],
                          id: AppCubit.get(context).movies[index]['movieID'],
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: AppCubit.get(context).movies.length),
          );
        } else {
          return Center(child: AutoSizeText('No items'));
        }
      },
    ));
  }
}
