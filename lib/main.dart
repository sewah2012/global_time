
import 'package:flutter/material.dart';
import 'package:globaltime/Home.dart';
import 'package:globaltime/loading.dart';
import 'package:globaltime/pick_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/Home':(context) => Home(),
    '/Location': (context) => PickLocation(),
  },
));
