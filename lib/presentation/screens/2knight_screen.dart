import 'package:flutter/material.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';
import 'package:movies_/data/model/movie_model.dart';
import 'package:movies_/presentation/components/navigator.dart';
import 'package:movies_/presentation/components/widgets/select_item.dart';
import 'package:movies_/presentation/components/widgets/similar_movies_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_/presentation/screens/home_screen.dart';

class KnightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movie? movie1;
    Movie? movie2;
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        movie1 = AppCubit.get(context).movie1;
        movie2 = AppCubit.get(context).movie2;
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeBottomNav(0, context);
                    movie1 = null;
                    movie2 = null;
                    AppCubit.get(context).similarMoviesSelctedMergeSet.clear();
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SelectMovieItem(
                      movie: movie1,
                      value: 1,
                    ),
                    SelectMovieItem(
                      movie: movie2,
                      value: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                if (movie1 != null && movie2 != null) SimilarMovies(),
              ],
            ));
      },
    );
  }
}
