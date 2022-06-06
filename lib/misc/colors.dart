import 'dart:ui';

abstract class ProjectColors {
  static const Color green = Color.fromRGBO(202, 255, 221, 1);
  static const Color orange = Color.fromRGBO(255, 135, 45, 1);
  static const Color darkOrange = Color.fromRGBO(253, 109, 0, 1);
  static const Color darkerOrange = Color.fromRGBO(182, 67, 22, 1);
  static const Color grey = Color.fromRGBO(134, 134, 134, 1);
  static const List<Color> shapeDialogBorderGradientColors = [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(140, 140, 140, 1),
  ];
  static const List<Color> shapeDialogBgGradientColors = [
    Color.fromRGBO(208, 208, 208, 1),
    Color.fromRGBO(190, 190, 190, 1),
    Color.fromRGBO(243, 243, 243, 1),
    Color.fromRGBO(225, 225, 225, 1),
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(200, 200, 200, 1),
    Color.fromRGBO(238, 238, 238, 1),
    Color.fromRGBO(200, 200, 200, 1),
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(236, 236, 236, 1),
    Color.fromRGBO(208, 208, 208, 1),
  ];
  static const List<Color> buttonGradientColors = [
    ProjectColors.orange,
    ProjectColors.darkOrange,
  ];
  static const List<Color> inputWidgetBorderColors = [
    Color.fromRGBO(194, 250, 214, 1),
    Color.fromRGBO(110, 110, 96, 1),
    Color.fromRGBO(81, 126, 99, 1),
  ];
  static const List<Color> inputWidgetBgColors = [
    Color.fromRGBO(56, 117, 107, 1),
    Color.fromRGBO(33, 60, 60, 1),
    Color.fromRGBO(26, 38, 39, 1),
    Color.fromRGBO(23, 30, 29, 1),
    Color.fromRGBO(23, 31, 28, 1),
  ];
  static const Color inputWidgetTextGlow = Color.fromRGBO(194, 250, 214, 1);
}
