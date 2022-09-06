import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:movies_/app_cubits/2knights_cubits/cubits.dart';
import 'package:movies_/app_cubits/2knights_cubits/states.dart';
import 'package:movies_/presentation/components/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem(
      {required this.poster,
      required this.name,
      required this.rating,
      required this.id,
      Key? key})
      : super(key: key);
  final String poster;
  final String name;
  final String rating;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0.r),
            child: AspectRatio(
              aspectRatio: 2 / 3.sp,
              child: FadeInImage.memoryNetwork(
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: 'https://image.tmdb.org/t/p/w300' + poster,
                  height: 180.0),
            ),
          ),
          SizedBox(
            width: 10.0.w,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 27.sp, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        double.parse(rating).toStringAsPrecision(2).toString(),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Icon(
                        Icons.star,
                        color: ratingColor,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20.sp, 0, 0),
            child: BlocBuilder<AppCubit, AppStates>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      AppCubit.get(context).deleteMovie(id);
                    },
                    icon: Icon(Icons.delete));
              },
            ),
          )
        ],
      ),
    );
  }
}
