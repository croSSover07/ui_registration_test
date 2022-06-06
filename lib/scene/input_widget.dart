import 'package:flutter/material.dart';
import 'package:ui_registration_test/misc/colors.dart';
import 'package:ui_registration_test/scene/double_rounded_corner_clip_path.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DoubleRoundedCornerClipPath(
        additionalRadius: 6.0,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ProjectColors.inputWidgetBorderColors,
          ),
        ),
        padding: const EdgeInsets.all(6.0),
        child: ClipPath(
          clipper: DoubleRoundedCornerClipPath(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: ProjectColors.inputWidgetBgColors,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: TextField(
                controller: controller,
                cursorColor: ProjectColors.orange,
                cursorRadius: const Radius.circular(2.5),
                cursorWidth: 5.0,
                style: const TextStyle(
                  shadows: [
                    BoxShadow(
                      color: ProjectColors.inputWidgetTextGlow,
                      offset: Offset(0, 1),
                      blurRadius: 20.0,
                      spreadRadius: 20.0,
                      blurStyle: BlurStyle.solid,
                    ),
                  ],
                  color: ProjectColors.green,
                  fontFamily: "SF Mono",
                  fontWeight: FontWeight.w700,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: hint,
                  hintStyle: const TextStyle(color: ProjectColors.green),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
