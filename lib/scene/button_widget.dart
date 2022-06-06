import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:ui_registration_test/misc/colors.dart';
import 'package:ui_registration_test/misc/string.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  State<StatefulWidget> createState() => StateSignUpButton();
}

class StateSignUpButton extends State<SignUpButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onPanDown: (details) {
          setState(() {
            isPressed = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            isPressed = false;
          });
          widget.onTap();
        },
        onPanEnd: (details) {
          setState(() {
            isPressed = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 5.0,
                spreadRadius: 2.0,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
          child: InnerShadow(
            offset: const Offset(1.0, 1.0),
            blur: 1.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.45,
                    0.55,
                  ],
                  colors: [
                    Colors.white,
                    Colors.grey,
                  ],
                ),
              ),
              padding: const EdgeInsets.all(6.0),
              child: _buildButtonCenter(context, isPressed, 4.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonCenter(
      BuildContext context, bool isPressed, double buttonHeight) {
    return Stack(
      children: [
        Container(
          child: _buttonLayer(
            bgColor: ProjectColors.darkerOrange,
            fgColor: Colors.transparent,
            paddingTop: buttonHeight,
            paddingBottom: 0.0,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 2.0),
                spreadRadius: 1.0,
                blurRadius: 2.0,
                color: Color.fromRGBO(0, 0, 0, 0.7),
              )
            ],
          ),
        ),
        InnerShadow(
          offset: const Offset(0, 2.0),
          blur: 1.0,
          child: _buttonLayer(
            bgColor: Colors.white,
            fgColor: Colors.transparent,
            paddingTop: 0.0,
            paddingBottom: buttonHeight,
          ),
        ),
        _buttonLayer(
          bgGradient: const LinearGradient(
            colors: ProjectColors.buttonGradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          fgColor: Colors.white,
          paddingTop: isPressed ? buttonHeight : 0.0,
          paddingBottom: isPressed ? 0.0 : buttonHeight,
        ),
      ],
    );
  }

  Widget _buttonLayer({
    Color? bgColor,
    Gradient? bgGradient,
    required Color fgColor,
    required double paddingTop,
    required double paddingBottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: paddingBottom,
        top: paddingTop,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          gradient: bgGradient,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 48.0,
          ),
          child: Text(
            ProjectStrings.signUpButtonText,
            style: TextStyle(
              shadows: const [
                Shadow(
                  offset: Offset(0.0, -2.0),
                ),
              ],
              fontFamily: "SF Mono",
              fontWeight: FontWeight.w800,
              color: fgColor,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
