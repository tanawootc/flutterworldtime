import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/choosing_location.dart';
import 'package:worldtime/pages/about_me.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
        '/about': (context) => AboutMe(),
      },
    ));

/*
void getmap() {
  Map Person = {'name': 'jj', 'age': 10};
  print(Person['name']);
}
*/
