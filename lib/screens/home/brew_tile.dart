import 'package:flutter/material.dart';
import 'package:brew_crew_app/models/brew.dart';
class BrewTile extends StatelessWidget {

  final Brew brew;
  BrewTile({required this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.only(top: 8.0),
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 6, 20, 0.0),
      child: ListTile(
        leading: CircleAvatar(

          backgroundImage: AssetImage('coffee_icon.png'),
          backgroundColor: Colors.brown[brew.strength],
          radius: 25.0,

        ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                brew.user,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Add spacing between title and subtitle
              Text(
                'Takes ${brew.sugars} sugars',
              ),
            ],
          ),
      ),
      
    ),) ;
  }
}
