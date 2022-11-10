import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_getx/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MaterialColor mycolor = MaterialColor(0xFFFFFF00, <int, Color>{
    50:  Color(0xFFFFFF00),
    100: Color(0xFFFFFF00),
    200: Color(0xFFFFFF00),
    300: Color(0xFFFFFF00),
    400: Color(0xFFFFFF00),
    500: Color(0xFFFFFF00),
    600: Color(0xFFFFFF00),
    700: Color(0xFFFFFF00),
    800: Color(0xFFFFFF00),
    900: Color(0xFFFFFF00),
  },
  );
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: Home(),
    );
  }
}
