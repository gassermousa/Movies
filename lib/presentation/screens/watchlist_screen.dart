import 'package:flutter/material.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';

import 'package:movies_/app_cubits/movieDetailes_cubit/moviedetaile_cubit_cubit.dart';
import 'package:movies_/data/services/moviesDatabase.dart';
import 'package:movies_/presentation/components/widgets/movie_item_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        if (AppCubit.get(context).movies.isNotEmpty) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return Text(AppCubit.get(context).movies[index]['title'] +
                    AppCubit.get(context).movies[index]['movieID'].toString());
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 7.0,
                );
              },
              itemCount: AppCubit.get(context).movies.length);
        } else {
          return Center(child: Text('data'));
        }
      },
    ));
  }
}
