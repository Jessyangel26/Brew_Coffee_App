import 'package:brew_crew_app/models/user.dart';
import 'package:brew_crew_app/services/database.dart';

import 'package:brew_crew_app/sharedcode/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew_app/models/user.dart';

class SettingForm extends StatefulWidget {


  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {

  final _formkey=GlobalKey<FormState>();
  List<String> sugars=['0','1', '2','3','4'];
  String _currentuser='';
  String _currentsugars='0';
  int _currentstrength=100;

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<Users?>(context);

    return StreamBuilder<UserData>(
      stream: Databaseservice(uid:user!.uid).userdata,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          UserData userData=snapshot.data!;


          return Form(
            key: _formkey,
            child: Column(
              children: [
                Text('update the brew crew',
                  style: TextStyle(fontSize: 18.0),),
                SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: userData?.user,
                  decoration: textinputdecoration,
                  validator: (val) => val!.isEmpty ? 'enter a name' : null,
                  onChanged: (val) =>
                      setState(() {
                        _currentuser = (val);
                      }),
                  //dropdown

                ),
                SizedBox(height: 20.0,),
                DropdownButtonFormField<String>(
                  decoration: textinputdecoration,
                  value: _currentsugars ?? userData.sugars,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem<String>(
                      value: sugar,
                      child: Text('$sugar sugars'),
                    );
                  }).toList(),
                  onChanged: (val) =>
                      setState(() {
                        if (sugars.contains(val)) {
                          _currentsugars = val!;
                        }
                      }),
                ),
                 SizedBox(height: 20.0,),
                Slider(
                  value: (_currentstrength ?? userData.strength).toDouble(),
                  min: 100,
                  max: 900,
                  divisions: 8,
                  activeColor: Colors.brown[_currentstrength],
                  inactiveColor: Colors.brown[_currentstrength],
                  onChanged: (value) {
                    setState(() {
                      _currentstrength = value.round();
                    });
                  },
                ),

                SizedBox(height: 20.0,),
                ElevatedButton(onPressed: () async {
                 if(_formkey.currentState?.validate()  ?? false){
                   await Databaseservice(uid: user.uid).Updateuserdata(
                     _currentuser ?? userData.user,
                     _currentsugars ?? userData.sugars,
                     _currentstrength ?? userData.strength
                   );
                   Navigator.pop(context);

                 }
                }, child: Text('update'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                  ),)
              ],
            ),

          );
        }
        else{
          return Loading();
    }
      }
    );
  }
}
