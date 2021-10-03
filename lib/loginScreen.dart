

import 'package:flutter/material.dart';
import 'package:flutter_assignment_movie/registerationScreen.dart';

import 'home screen.dart';

import 'constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool spinwhool = false;
  late String email;
  late String password;

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinwhool,
        opacity: 0.1,
        color: Colors.black,
        progressIndicator: CircularProgressIndicator(backgroundColor: Colors.black,),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kMessageTextFieldDecoration2,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  //
                  password = value;
                },
                decoration: kMessageTextFieldDecoration2.copyWith(hintText: "Enter your Password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              button(color: Colors.lightBlueAccent,text: 'Log In',onpress: () async {
                setState(() {
                  spinwhool = true;
                });
                try{
                  final existuser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(existuser != null)
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Homescreen();
                    }));
                  }
                  setState(() {
                    spinwhool = true;
                  });
                }
                catch(e)
                {
                  print(e);
                }

              },),
              SizedBox(height: 50,),
              InkWell(
                onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return RegistrationScreen();
                    }));
                  },
                  child: Center(child: Text('Register')))
            ],
          ),
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  button({required this.color,required this.text,required this.onpress});
  final Color color;
  final String text;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onpress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
