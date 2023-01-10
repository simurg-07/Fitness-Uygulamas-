import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: Get.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -10,
            right:-10,
            child: Image.asset(
              "assets/images/top1.png",
              width: Get.width
            ),
          ),
          Positioned(
            top: -10,
            right:-10,
            child: Image.asset(
              "assets/images/top2.png",
              width: Get.width
            ),
          ),
          Positioned(
            top: 40,
            right: 0,
            child: Lottie.network(
                "https://assets8.lottiefiles.com/packages/lf20_ju61m9x9.json",
                width: Get.width * 0.35
            ),
          ),
          Positioned(
            bottom: -10,
            right: 10,
            child: Image.asset(
              "assets/images/bottom1.png",
              width: Get.width
            ),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: Image.asset(
              "assets/images/bottom2.png",
              width: Get.width
            ),
          ),
          child
        ],
      ),
    );
  }
}