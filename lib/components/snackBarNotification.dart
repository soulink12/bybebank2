import 'package:flutter/material.dart';

void snackBarNotification(BuildContext context, String text) {


  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 2000),
    ),
  );
}
