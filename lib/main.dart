//import 'package:advance/hero.dart';
import 'package:advance/air.dart';
import 'package:advance/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    // theme: _lightTheme,
    // darkTheme: _darkTheme,
    //theme: ThemeData(textTheme: TextTheme(bodyText1: TextStyle(fontSize: 50))),
      debugShowCheckedModeBanner: false,
      title: 'GetX app',
      initialRoute: "/Air",

      getPages: [

        GetPage(name: "/Home", page: ()=> Home()),
        GetPage(name: "/Air", page: ()=> Air()),

      ],
    );
  }
}

