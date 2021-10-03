import 'package:flutter/material.dart';
import 'constant.dart';
import 'home screen.dart';
import 'loginScreen.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  late String email;
  late String password;
  bool spin =false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spin,
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
                  decoration: kMessageTextFieldDecoration2.copyWith(hintText: 'Enter your email',)
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kMessageTextFieldDecoration2.copyWith(hintText: "Enter your Password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              button(color: Colors.blueAccent,text: 'Register',onpress: () async {
                setState(() {
                  spin = true;
                });
                try{
                  final newuser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(newuser != null)
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Homescreen();
                    }));
                    setState(() {
                      spin = false;
                    });
                  }

                }
                catch(e)
                {
                  print(e);
                }
              }

              ),
            ],
          ),
        ),
      ),
    );
  }
}
