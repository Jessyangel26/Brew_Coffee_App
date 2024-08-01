import 'package:brew_crew_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew_app/models/user.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create an user object based on firebase
Users? _userfromfirebaseuser(User? user){
  return user != null ? Users(uid: user.uid) : null;
}


//stream get from user
  Stream<Users?> get user{
  return _auth.authStateChanges().map(_userfromfirebaseuser);
  }


  // sign in anon

  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  //sign in
  Future SignInwithemailandpassword(String email,String password) async{
  try{
    UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
    User? user=result.user;
    return _userfromfirebaseuser(user);
  }
  catch(e){
    print(e.toString());
    return null;
  }
  }
  //register in
  Future Registerwithemailandpassword(String email,String password) async{
  try{
    UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user=result.user;
    //create a new document form firebase
    await Databaseservice(uid: user!.uid).Updateuserdata('enter a YOUR name', '5', 100);
    return _userfromfirebaseuser(user!);


  }
  catch(e){
    print(e.toString());
    return null;
  }
  }
  //sign out
Future SignOut() async{
  try {
    return await _auth.signOut();
  }
  catch(e){
    print(e.toString());
    return null;

  }

}
}