import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadTitleMovies extends StatelessWidget {
  final String? title;

  HeadTitleMovies({this.title});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title!,
      style: TextStyle(fontSize: 18.0.sp, color: Colors.white),
    );
  }
}
