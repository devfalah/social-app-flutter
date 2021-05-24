import 'package:flutter/cupertino.dart';

class CurveCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 4 * size.height / 5);
    var curvePoint1 = Offset(size.width / 4, size.height);
    var centerPoint = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      centerPoint.dx,
      centerPoint.dy,
    );
    var curvePoint2 = Offset(3 * size.width / 4, 3 * size.height / 5);
    var endPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePoint2.dx,
      curvePoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
