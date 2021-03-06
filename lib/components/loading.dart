import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String message;

  Loading(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text(message),
          ],
        ),
      ),
    );
  }
}
