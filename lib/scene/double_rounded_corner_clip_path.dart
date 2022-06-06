import 'dart:math';

import 'package:flutter/material.dart';

class DoubleRoundedCornerClipPath extends CustomClipper<Path> {
  DoubleRoundedCornerClipPath({
    this.cornerCutRadius = 16.0,
    this.rounderSizeFactor = 0.25,
    this.additionalRadius = 0.0,
  }) {
    cornerCutRadius += additionalRadius * sin(45 * pi / 180);
  }

  double cornerCutRadius;
  double rounderSizeFactor;
  double additionalRadius;

  @override
  Path getClip(Size size) {
    double rounder = cornerCutRadius * rounderSizeFactor;
    double degreeToRad = pi / 180;
    double angledRounder = rounder * sin(45 * degreeToRad);
    double rounderRadius = rounder * tan(67.5 * degreeToRad);

    Path path = Path();

    //начало top left угол  (правая точка)
    path.moveTo(0 + cornerCutRadius - angledRounder, 0.0 + angledRounder);
    path.arcToPoint(
      Offset(0 + cornerCutRadius + rounder, 0.0),
      radius: Radius.circular(rounderRadius),
    );

    //движение по часовой стрелке
    path.lineTo(size.width - cornerCutRadius - rounder, 0.0);
    path.arcToPoint(
      Offset(size.width - cornerCutRadius + angledRounder, 0.0 + angledRounder),
      radius: Radius.circular(rounderRadius),
    );

    path.lineTo(
        size.width - angledRounder, 0 + cornerCutRadius - angledRounder);
    path.arcToPoint(
      Offset(size.width, 0.0 + cornerCutRadius + rounder),
      radius: Radius.circular(rounderRadius),
    );

    path.lineTo(size.width, size.height - cornerCutRadius - rounder);
    path.arcToPoint(
      Offset(size.width - angledRounder,
          size.height - cornerCutRadius + angledRounder),
      radius: Radius.circular(rounderRadius),
    );

    path.lineTo(size.width - cornerCutRadius + angledRounder,
        size.height - angledRounder);
    path.arcToPoint(
      Offset(size.width - cornerCutRadius - rounder, size.height),
      radius: Radius.circular(rounderRadius),
    );

    path.lineTo(0.0 + cornerCutRadius + rounder, size.height);
    path.arcToPoint(
      Offset(
          0.0 + cornerCutRadius - angledRounder, size.height - angledRounder),
      radius: Radius.circular(rounderRadius),
    );

    path.lineTo(
        0 + angledRounder, size.height - cornerCutRadius + angledRounder);
    path.arcToPoint(
      Offset(0.0, size.height - cornerCutRadius - rounder),
      radius: Radius.circular(rounderRadius),
    );

    path.lineTo(0.0, 0.0 + cornerCutRadius + rounder);
    path.arcToPoint(
      Offset(0.0 + angledRounder, 0.0 + cornerCutRadius - angledRounder),
      radius: Radius.circular(rounderRadius),
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
