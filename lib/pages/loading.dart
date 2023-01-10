import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../loginScreens/login/login.dart';
import 'bottomnavigationbar.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({Key? key}) : super(key: key);

  @override
  _loadingScreenState createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1000),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return FirebaseAuth.instance.currentUser == null ? LoginScreen():bottomnavigaionbarScreen();
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.6, 0.8),
            colors: <Color>[
              Color(0xffF3F3F3),
              Color(0xff4e5ac7),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/dumbell.svg',
            height: Get.width / 3,
          ),
        ),
      ),
    );
  }
}
