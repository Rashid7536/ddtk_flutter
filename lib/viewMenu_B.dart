import 'viewMenu_PRA.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class viewMenuB extends StatefulWidget {
  @override
  State<viewMenuB> createState() => _viewMenuBState();
}

class _viewMenuBState extends State<viewMenuB> {
  Query ref = FirebaseDatabase.instance.ref().child('patientdata');
  void retreiveData() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Blood Group'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(children: [
          //Blood Group A
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => viewMenuPRA(
                          'A',
                        )));
              },
              child: Text('A')),

          //Blood Group B
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => viewMenuPRA(
                          'B',
                        )));
              },
              child: Text('B')),

          //Blood Group AB
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => viewMenuPRA(
                          'AB',
                        )));
              },
              child: Text('AB')),

          //Blood Group O
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => viewMenuPRA(
                          'O',
                        )));
              },
              child: Text('O')),
        ]),
      ),
    );
  }
}
