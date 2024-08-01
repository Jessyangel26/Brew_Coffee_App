import 'package:brew_crew_app/services/auth.dart';
import 'package:brew_crew_app/sharedcode/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew_app/sharedcode/constant.dart';

class Signin extends StatefulWidget {
final Function toggleView;
Signin({required this.toggleView});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
 final AuthService _auth= AuthService();
 final _formkey=GlobalKey<FormState>();
 String email='';
 String password='';
 String error='';
 bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('SIGN IN BREW CREW'),
        actions: [
          TextButton.icon(onPressed: () {
            widget.toggleView();
          }, icon: Icon(Icons.person), label: Text('Register'))
        ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: textinputdecoration.copyWith(hintText:'Email'),
                validator: (val)=> val!.isEmpty? 'enter a valid email':null,
                onChanged: (val){
                  setState(() =>email = val);

                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textinputdecoration.copyWith(hintText:'Password'),
                validator: (val)=>val!.length < 6?'password atleast 6 character':null,
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
                dynamic result=await _auth.SignInwithemailandpassword(email,password);
                if(result==null) {
                  setState(() {
                    error = 'could not sign in with those credentials';
                    loading=false;
                  });
                }

                }
              }, child: Text('Sign in ',
              style: TextStyle(


              ),
              ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                ),
              ),
              SizedBox(height: 20.0,),
              Text(error,
              style: TextStyle(
                color: Colors.red,

              ),)
            ],
          ),
        ),
      ),
    );
  }
}
