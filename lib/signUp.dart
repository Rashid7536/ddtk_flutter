import '../database.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final fdb = FirebaseDatabase.instance;
  final dataB = Database_mthds();
  final fauth = FirebaseAuth.instance;
  final eControl = TextEditingController();
  final passControl = TextEditingController();
  final passConfControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text("Sign Up"),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: SizedBox(
            width: 250,
            height: 500,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  controller: eControl,
                  decoration: InputDecoration(
                      filled: true,
                      //fillColor: Colors.white,
                      //hintText: "Username",
                      labelText: "     Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passControl,
                  decoration: InputDecoration(
                      filled: true,
                      //hintText: "Username",
                      labelText: "     PassWord",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passConfControl,
                  decoration: InputDecoration(
                      filled: true,
                      //hintText: "Username",
                      labelText: "     Confirm PassWord",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
                Padding(padding: EdgeInsets.all(30)),
                ElevatedButton(
                    onPressed: () async {
                      if (passControl.text == passConfControl.text) {
                        try {
                          //SignIn();
                          await fauth.createUserWithEmailAndPassword(
                              email: eControl.text.trim(),
                              password: passControl.text.trim());
                          await fauth.signInWithEmailAndPassword(
                              email: 'registrar@ddtk.com', password: 'ddtk123');
                          await dataB
                              .addUser(eControl.text.toLowerCase().trim());
                          await fauth.signOut();

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => login_p()));
                          Fluttertoast.showToast(msg: "Sign Up Success");
                          eControl.text = "";
                          passControl.text = "";
                          passConfControl.text = "";
                        } on FirebaseAuthException catch (e) {
                          Fluttertoast.showToast(
                              msg: "Sign Up Failed: \n${e.message}");
                        }
                      } else {
                        Fluttertoast.showToast(msg: "PassWords does not match");
                      }
                    },
                    child: Text("Sign Up")),
                Padding(padding: EdgeInsets.all(10)),
              ],
            ),
          ),
        ));
  }
}
