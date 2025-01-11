//import 'home_page.dart';
import 'home_page.dart';
import 'signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

//final database = FirebaseDatabase.instance.ref();

class login_p extends StatefulWidget {
  const login_p({super.key});

  @override
  State<login_p> createState() => _login_pState();
}

class _login_pState extends State<login_p> {
  //final fdb = FirebaseDatabase.instance;
  final fauth = FirebaseAuth.instance;
  final nameControl = TextEditingController();
  final passControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: SizedBox(
            width: 250,
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      'lib/Assets/mainP.jpg',
                      scale: 2.5,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextField(
                    controller: nameControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     UserName",
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
                  Padding(padding: EdgeInsets.all(30)),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          //SignIn();
                          await fauth.signInWithEmailAndPassword(
                              email: nameControl.text.trim(),
                              password: passControl.text.trim());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => home_p()));
                          Fluttertoast.showToast(msg: "Login Success");
                          nameControl.text = "";
                          passControl.text = "";
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg:
                                  "Login Failed\nPlease check your\nUserName and Password");
                        }
                        //Navigator.of(context).push(MaterialPageRoute(builder:   (context) => home_p()));
                      },
                      child: Text("Login")),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => signUp()));
                      },
                      child: Text("Sign Up"))
                ],
              ),
            ),
          ),
        ));
  }
  // Future SignIn() async{
  //   await fauth.signInWithEmailAndPassword(email: nameControl.text.trim(), password: passControl.text.trim());
  // }
}
