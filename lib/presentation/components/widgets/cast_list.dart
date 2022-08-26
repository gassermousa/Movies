import 'package:flutter/material.dart';
import 'package:movies_/data/model/cast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastList extends StatelessWidget {
  const CastList({Key? key, this.casts}) : super(key: key);
  final List<Cast>? casts;
  @override
  Widget build(BuildContext context) {
    print(casts!.first.name);
    return SizedBox(
      height: 130.0.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: casts!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10.0.h, right: 8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                  child: Stack(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.black87,
                        highlightColor: Colors.white54,
                        enabled: true,
                        child: SizedBox(
                          height: 120.0.h,
                          child: AspectRatio(
                              aspectRatio: 2 / 3.sp,
                              child: Icon(
                                FontAwesome5.user_alt,
                                color: Colors.black26,
                                size: 40.0.sp,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 120.0.h,
                        child: Stack(
                          children: [
                            AspectRatio(
                                aspectRatio: 2 / 3.sp,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0.r),
                                  child: FadeInImage.memoryNetwork(
                                      fit: BoxFit.cover,
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            'assets/image/cast_placeholder.png',
                                            fit: BoxFit.cover);
                                      },
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            'assets/image/cast_placeholder.png',
                                            fit: BoxFit.cover);
                                      },
                                      placeholder: kTransparentImage,
                                      image:
                                          "https://image.tmdb.org/t/p/w300/" +
                                              casts![index].img!),
                                )),
                            AspectRatio(
                              aspectRatio: 2 / 3.sp,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.2),
                                      Colors.black.withOpacity(0.5)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: const [0, 1],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 3.0.h,
                                left: 3.0.w,
                                right: 3.0.w,
                                child: SizedBox(
                                  width: 80.0.w,
                                  child: AutoSizeText(
                                    casts![index].name!,
                                    style: TextStyle(fontSize: 10.0.sp),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
