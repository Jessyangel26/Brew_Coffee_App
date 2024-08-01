import 'package:brew_crew_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew_app/sharedcode/constant.dart';
import 'package:brew_crew_app/sharedcode/loading.dart';
class Register extends StatefulWidget {

  final VoidCallback  toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
final _formkey =GlobalKey<FormState>();
  final AuthService _auth= AuthService();
  String email='';
  String password='';
  String error='';
  bool loading=false;


  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('SIGN UP BREW CREW'),
        actions: [
          TextButton.icon(
              onPressed:widget.toggleView,
           icon: Icon(Icons.person), label: Text('Sign IN'))
        ],
    ),





      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: textinputdecoration.copyWith(hintText: 'Email'),
                validator:(val)=> val!.isEmpty ? 'enter a email':null,
                onChanged: (val){
                  setState(() =>email = val);

                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textinputdecoration.copyWith(hintText: 'Password'),
                validator: (val)=> val!.length  < 6 ? 'enter a password atleast 6 character':null,
                obscureText: true,
                onChanged: (val){
                  setState(()=> password = val);

                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(onPressed: () async{
                if(_formkey.currentState?.validate()?? false){
                  setState(() {
                    loading=true;
                  });
                 dynamic result=await _auth.Registerwithemailandpassword(email, password);
                  if(result==null){
                    setState(() {
                      error='please provide a valid email';
                      loading=false;
                    });
                  }

                }

                print(email);
                print(password);
              }, child: Text('Register',
                style: TextStyle(


                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                ),
              ),
              SizedBox(height: 20.0,),
              Text(error,
              style: TextStyle(
                color: Colors.red,fontSize: 14.0,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
