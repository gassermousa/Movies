import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyMovieDetailsScreen extends StatelessWidget {
  const EmptyMovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'No Movie Details',
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
      )),
    );
  }
}
