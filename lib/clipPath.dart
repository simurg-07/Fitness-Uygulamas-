import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _clipPath extends StatelessWidget {
  const _clipPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: double.infinity,
        height: 300,
        color: Colors.amber,

      ),
    );
  }
}

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

