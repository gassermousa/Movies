import 'package:flutter/material.dart';
import 'package:movies_/data/model/movie_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MovieItemDatabase extends StatelessWidget {
  final Map movie;
  const MovieItemDatabase(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('mamy' + movie.toString());
    return Row(
      children: [
        Stack(
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.black87,
              highlightColor: Colors.white54,
              enabled: true,
              child: SizedBox(
                height: 160.0.h,
                child: AspectRatio(
                    aspectRatio: 2 / 3.sp,
                    child: Icon(
                      FontAwesome5.film,
                      color: Colors.black26,
                      size: 40.0.sp,
                    )),
              ),
            ),
            SizedBox(
              height: 160.0.h,
              child: AspectRatio(
                  aspectRatio: 2 / 3.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0.r),
                    child: FadeInImage.memoryNetwork(
                        fit: BoxFit.cover,
                        placeholder: kTransparentImage,
                        image: 'https://image.tmdb.org/t/p/w300' +
                            movie['poster']),
                  )),
            ),
          ],
        ),
        SizedBox(
          width: 10.0.w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.0.w,
                child: AutoSizeText(
                  movie['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      height: 1.0.h,
                      color: Colors.white,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                              fontSize: 16.0.sp, fontWeight: FontWeight.bold)
                          .fontSize),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    AutoSizeText(
                      movie['rating'].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.bold)
                              .fontSize),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    // Icon(
                    //   EvaIcons.heartOutline,
                    //   color: Colors.red,
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.delete))
      ],
    );
  }
}
