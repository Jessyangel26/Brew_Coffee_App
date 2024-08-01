

import 'package:brew_crew_app/models/brew.dart';
import 'package:brew_crew_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Databaseservice {
  final String uid;
  Databaseservice({required this.uid});
  //reference collection
  final CollectionReference brewcollection=FirebaseFirestore.instance.collection('brews');
  Future Updateuserdata(String user,String sugars,int strength) async{
    return await brewcollection.doc(uid).set({
      'user':user,
      'sugars':sugars,
      'strength':strength,
    });

  }
  //brewlist from querysnapshot

  List<Brew> _brewlistfromquerysnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      final data = doc.data() as Map<String, dynamic>; // Cast to Map<String, dynamic>
      return Brew(user: data['user'] ?? ' ', strength: data['strength'] ?? 0, sugars: data['sugars'] ?? '0');
    }).toList();
  }

  //get brews stream

  Stream<List<Brew>> get brews{
    return brewcollection.snapshots().map(_brewlistfromquerysnapshot);
    
    
}
UserData _userdatafromsnapshot(DocumentSnapshot snapshot){
 final data = snapshot.data() as Map<String,dynamic>;
 // final data = doc.data() as Map<String, dynamic>;
    return UserData(uid: uid,
      user:data['user'],
      sugars:data['sugars'] ,
      strength:data['strength'],

    );
}
//get the userdoc stream
Stream<UserData> get userdata{
    return brewcollection.doc(uid).snapshots().map(_userdatafromsnapshot);

}
}