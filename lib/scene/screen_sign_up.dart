import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:ui_registration_test/scene/button_widget.dart';
import 'package:ui_registration_test/misc/colors.dart';
import 'package:ui_registration_test/misc/string.dart';
import 'package:ui_registration_test/scene/double_rounded_corner_clip_path.dart';
import 'package:ui_registration_test/scene/input_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _backgroundWidget(context),
        _dialogWidget(context),
      ],
    );
  }

  Widget _backgroundWidget(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
    );
  }

  Widget _dialogWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Stack(
            children: [
              _gearsWidget(),
              _shapeDialogWidget(),
              _uiElementsDialogWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shapeDialogWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 36.0, left: 16, right: 16),
      child: ClipPath(
        clipper: DoubleRoundedCornerClipPath(
          cornerCutRadius: 35.0,
          rounderSizeFactor: 0.35,
          additionalRadius: 4.0,
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ProjectColors.shapeDialogBorderGradientColors,
              stops: [0.0, 0.02],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipPath(
              clipper: DoubleRoundedCornerClipPath(
                cornerCutRadius: 35.0,
                rounderSizeFactor: 0.35,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: SweepGradient(
                    center: FractionalOffset.center,
                    endAngle: pi * 2,
                    colors: ProjectColors.shapeDialogBgGradientColors,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: TextButton(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset("assets/svg_close.svg"),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey.withOpacity(0.4)),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 96.0,
        right: 96.0,
        top: 32.0,
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: InnerShadow(
          blur: 1.0,
          color: Color.fromRGBO(0, 0, 0, 0.7),
          offset: Offset(1.0, 2.0),
          child: Text(
            "Sign up for\nour newsletter",
            style: TextStyle(
              color: ProjectColors.grey,
              fontFamily: "SF Compact Rounded",
              fontWeight: FontWeight.w800,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _gearsWidget() {
    return Align(
      alignment: Alignment.topCenter,
      child: SvgPicture.asset(
        "assets/shape.svg",
        clipBehavior: Clip.antiAlias,
      ),
    );
  }

  Widget _uiElementsDialogWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 30.0),
        _titleWidget(),
        const SizedBox(height: 20.0),
        InputWidget(
          controller: _nameController,
          hint: ProjectStrings.hintName,
        ),
        const SizedBox(height: 20.0),
        InputWidget(
          controller: _emailController,
          hint: ProjectStrings.hintEmail,
        ),
        const SizedBox(height: 20.0),
        SignUpButton(onTap: () {}),
        const SizedBox(height: 32.0),
      ],
    );
  }
}
