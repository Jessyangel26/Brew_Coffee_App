import 'package:brew_crew_app/screens/autheticate/autheticate.dart';
import 'package:brew_crew_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew_app/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<Users?>(context);

  // return home or autheticate page
    if(user==null) {
      return Autheticate();
    }
    else{
      return Home();
    }
  }
}
