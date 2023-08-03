import 'package:flutter/material.dart';
import 'package:inf_random/utils/constants.dart';

AppBar myAppBar({final String title = Constants.appTitle}) {
  return AppBar(
    title: Text(
      title,
      textScaleFactor: 1.2,
    ),
  );
}
