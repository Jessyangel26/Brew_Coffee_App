import 'package:brew_crew_app/models/brew.dart';
import 'package:brew_crew_app/models/user.dart';
import 'package:brew_crew_app/screens/home/setting_form.dart';
import 'package:brew_crew_app/services/auth.dart';
import 'package:brew_crew_app/services/database.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew_app/screens/home/brews_list.dart';

class Home extends StatelessWidget {

final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    void showsettingsbottom(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingForm(),
          );


      });
    }
    return StreamProvider<List<Brew>>.value(
      value:Databaseservice(uid:' ').brews,
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('BREW CREWW'),
          actions: [
            TextButton.icon(onPressed: () async{
              await _auth.SignOut();

            }, icon: Icon(Icons.person), label:Text('LOG out')),
            TextButton.icon(onPressed:()=> showsettingsbottom(), icon: Icon(Icons.settings), label: Text('Settings'))
          ],
        ),
body: Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage('https://as2.ftcdn.net/v2/jpg/01/34/32/07/1000_F_134320714_COdVaFboGrHb327QK3rsw1EAi8W5g8hj.jpg'),
      fit: BoxFit.cover,
    )
  ),
    child: BrewList()),

      ),
    );

  }
}
