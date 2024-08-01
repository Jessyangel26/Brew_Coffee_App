import 'package:brew_crew_app/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:brew_crew_app/screens/home/brew_tile.dart';
import 'package:provider/provider.dart';

import 'package:brew_crew_app/services/database.dart';
class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {

  @override
  Widget build(BuildContext context) {
    final brews =Provider.of<List<Brew>?>(context) ?? [];
    if (brews!=null) {
      // print(brews?.docs);
      brews.forEach((brew) {
        print(brew.user);
        print(brew.sugars);
        print(brew.strength);
      });
    }
    return ListView.builder(
        itemCount: brews?.length,
        itemBuilder: (context,index){
          return BrewTile(brew:brews![index]);

    });


  }
}

