import 'package:flutter/material.dart';
import 'package:ui_registration_test/scene/screen_sign_up.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: SignUpScreen(),
      ),
    ),
  );
}
