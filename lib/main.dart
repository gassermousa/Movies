// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';

import 'package:movies_/cach_helper/cach_helper.dart';
import 'package:movies_/data/repository/repository.dart';
import 'package:movies_/data/services/moviesDatabase.dart';
import 'package:movies_/data/services/movies_api.dart';

import 'package:movies_/network/remote/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_/presentation/Theme/themes.dart';
import 'package:movies_/data/constant/constant.dart';
import 'package:movies_/presentation/screens/Layout.dart';

import 'app_cubits/movieDetailes_cubit/moviedetaile_cubit_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  isDark = CacheHelper.getdata(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MovieRepository movieRepository =
      MovieRepository(ApiSrevices(), MoviesDatabase());
  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(movieRepository)
            ..changeMode(fromShared: isDark)
            ..getNowPlayingMovies()
            ..getUpComingMovies()
            ..getTopRatedMovies()
            ..getPopularMovies()
            ..getAllGenres()
            ..createDatabase(),
        ),
        BlocProvider(
          create: (_) {
            return MoviedetaileCubitCubit(movieRepository);
          },
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(392.7, 759.3),
            builder: (context, chidl) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: LightTheme,
                darkTheme: darkTheme,
                themeMode: AppCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: LayoutScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
