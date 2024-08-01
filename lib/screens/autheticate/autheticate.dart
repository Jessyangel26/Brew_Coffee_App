import 'package:brew_crew_app/screens/autheticate/register.dart';
import 'package:brew_crew_app/screens/autheticate/signin.dart';

import 'package:flutter/material.dart';

class Autheticate extends StatefulWidget {
  @override
  State<Autheticate> createState() => _AutheticateState();
}

class _AutheticateState extends State<Autheticate> {
  bool showsignin = true;

  void toggleView() {
    return setState(() {
      showsignin = !showsignin;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return Signin(toggleView: toggleView);
    }
    else {
      return Register(toggleView: toggleView);
    }
  }
}

