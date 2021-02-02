import 'package:flutter/material.dart';

class HeaderBackgroundShape extends CustomClipper<Path> {
  
  @override
  Path getClip(Size size) {
  
    Path path = Path();
    final double _xScaling = size.width / 1080;
    final double _yScaling = size.height / 445;
    path.lineTo(1079.99 * _xScaling, 84 * _yScaling);
    path.cubicTo(
      1079.99 * _xScaling,
      84 * _yScaling,
      1080 * _xScaling,
      84 * _yScaling,
      1080 * _xScaling,
      84 * _yScaling,
    );
    path.cubicTo(
      1080 * _xScaling,
      84 * _yScaling,
      1080 * _xScaling,
      0 * _yScaling,
      1080 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      1080 * _xScaling,
      0 * _yScaling,
      994.967 * _xScaling,
      0 * _yScaling,
      994.967 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      994.967 * _xScaling,
      0 * _yScaling,
      973 * _xScaling,
      0 * _yScaling,
      973 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      973 * _xScaling,
      0 * _yScaling,
      107 * _xScaling,
      0 * _yScaling,
      107 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      107 * _xScaling,
      0 * _yScaling,
      77.6538 * _xScaling,
      0 * _yScaling,
      77.6538 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      77.6538 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      84 * _yScaling,
      0 * _xScaling,
      84 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      84 * _yScaling,
      2.11628 * _xScaling,
      84 * _yScaling,
      2.11628 * _xScaling,
      84 * _yScaling,
    );
    path.cubicTo(
      2.11628 * _xScaling,
      84 * _yScaling,
      1 * _xScaling,
      90 * _yScaling,
      1 * _xScaling,
      90 * _yScaling,
    );
    path.cubicTo(
      1 * _xScaling,
      90 * _yScaling,
      0 * _xScaling,
      90 * _yScaling,
      0 * _xScaling,
      90 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      90 * _yScaling,
      0 * _xScaling,
      398.444 * _yScaling,
      0 * _xScaling,
      398.444 * _yScaling,
    );
    path.cubicTo(
      115.239 * _xScaling,
      427.897 * _yScaling,
      252.666 * _xScaling,
      445 * _yScaling,
      400.224 * _xScaling,
      445 * _yScaling,
    );
    path.cubicTo(
      706.228 * _xScaling,
      445 * _yScaling,
      968.66 * _xScaling,
      371.446 * _yScaling,
      1080 * _xScaling,
      266.733 * _yScaling,
    );
    path.cubicTo(
      1080 * _xScaling,
      266.733 * _yScaling,
      1080 * _xScaling,
      84.0217 * _yScaling,
      1080 * _xScaling,
      84.0217 * _yScaling,
    );
    path.cubicTo(
      1080 * _xScaling,
      84.0217 * _yScaling,
      1079.99 * _xScaling,
      84 * _yScaling,
      1079.99 * _xScaling,
      84 * _yScaling,
    );
    path.cubicTo(
      1079.99 * _xScaling,
      84 * _yScaling,
      1079.99 * _xScaling,
      84 * _yScaling,
      1079.99 * _xScaling,
      84 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  }

