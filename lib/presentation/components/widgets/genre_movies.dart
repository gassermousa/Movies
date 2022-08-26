import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';
import 'package:movies_/data/constant/constant.dart';
import 'package:movies_/data/model/genre_model.dart';
import 'package:movies_/presentation/components/colors.dart';
import 'package:movies_/presentation/components/widgets/movie_item.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GenreMovies extends StatelessWidget {
  const GenreMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Genre> genres = [];
    int check = 0;
    final ScrollController _controller = ScrollController();
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        int indexScreen = AppCubit.get(context).currentIndex;
        if (AppCubit.get(context).generes.isNotEmpty) {
          genres = AppCubit.get(context).generes;
        }

        return Padding(
          padding: EdgeInsets.only(top: 20.0, left: 8.0.w),
          child: SizedBox(
              height: AppCubit.get(context).moviesByGenre.isNotEmpty
                  ? 310.0.h
                  : 50.0.h,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ChoiceChip(
                          backgroundColor: Colors.black38,
                          selectedColor: defaultColor,
                          label: AutoSizeText(
                            genres[index].name!.toUpperCase(),
                          ),
                          labelStyle: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .color!
                                  .withOpacity(0.9)),
                          onSelected: (selected) {
                            if (selected) {
                              check++;
                              AppCubit.get(context).changeSelection(index);
                              AppCubit.get(context)
                                  .getMoviesByGenre(genres[index].id!);
                              scrollLeft(_controller);
                              print(index.toString() + 'egypt');
                              print(AppCubit.get(context).generes[index].id);
                            }
                          },
                          selected: AppCubit.get(context).selected == index),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.0.h,
                      ),
                      itemCount: genres.length,
                    ),
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  if (AppCubit.get(context).moviesByGenre.isNotEmpty)
                    SizedBox(
                      height: 240.0.h,
                      child: ListView.separated(
                          controller: _controller,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (check == 0) {
                              AppCubit.get(context)
                                  .getMoviesByGenre(genres[0].id!);

                              return buildMovieItem(
                                  AppCubit.get(context).moviesByGenre[index],
                                  context,
                                  indexScreen);
                            } else {
                              print(
                                  AppCubit.get(context).moviesByGenre[0].title);
                              print(check.toString() + '  Not lol');
                              return buildMovieItem(
                                  AppCubit.get(context).moviesByGenre[index],
                                  context,
                                  indexScreen);
                            }
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10.0.w,
                              ),
                          itemCount:
                              AppCubit.get(context).moviesByGenre.length),
                    )
                ],
              )),
        );
      },
    );
  }
}
