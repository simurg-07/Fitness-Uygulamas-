
import 'package:flutter/material.dart';


class MyClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size){
    return Path()
        ..lineTo(100, size.height)
        ..quadraticBezierTo(size.width - 300, size.height - 200, size.width - 200, size.height + 200,
        )
      ..quadraticBezierTo(3/4 * size.width, size.height - 100, size.width, size.height - 90,
      )
      ..lineTo(0, size.height);
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper ){
    return false;
  }

}

