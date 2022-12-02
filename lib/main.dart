import 'package:flutter/material.dart';

import 'package:timeapp/pages/loading.dart';
import 'package:timeapp/pages/home.dart';
import 'package:timeapp/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
