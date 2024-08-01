import 'package:brew_crew_app/models/user.dart';
import 'package:brew_crew_app/screens/wrapper.dart';
import 'package:brew_crew_app/services/auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBEqVxZaZf5eK0G83YrIOy0L3InCl2fk1s',
      appId: '1:363356373359:android:5ea8565028bdcb745ba89a',
      messagingSenderId: '363356373359',
      projectId: 'flutter-project-58857',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


    @override
    Widget build(BuildContext context) {
      return StreamProvider<Users?>.value(
        initialData: null,
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      );


    }
  }





