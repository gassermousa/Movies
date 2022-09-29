import 'package:flutter/material.dart';

class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 5, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              size: 220,
            ),
            Text('No Connection !')
          ],
        ),
      ),
    );
  }
}
