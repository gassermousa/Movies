import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';
import 'package:movies_/data/model/movie_model.dart';
import 'package:movies_/presentation/components/widgets/movie_item.dart';
import 'package:movies_/presentation/components/widgets/title_list_movies.dart';

class PopularMovies extends StatelessWidget {
  final int? value;
  const PopularMovies({Key? key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Movie> movies = [];
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        int indexScreen = AppCubit.get(context).currentIndex;
        if (AppCubit.get(context).popularMovies.isNotEmpty) {
          movies = AppCubit.get(context).popularMovies;
          print('Popular Movies ' + movies.first.title!);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0.sp),
              child: HeadTitleMovies(
                title: 'Popular Movies',
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.sp),
              child: SizedBox(
                height: 240.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return buildMovieItem(movies[index], context, indexScreen,
                          value: value);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10.0.w,
                      );
                    },
                    itemCount: movies.length),
              ),
            ),
          ],
        );
      },
    );
  }
}
