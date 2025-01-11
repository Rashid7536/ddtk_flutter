import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '_listBox.dart';
import 'package:firebase_database/firebase_database.dart';

class viewlistp extends StatefulWidget {
  const viewlistp({super.key});

  @override
  State<viewlistp> createState() => _viewlistpState();
}

class _viewlistpState extends State<viewlistp> {
  Query ref = FirebaseDatabase.instance.ref().child('patientdata');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Page'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        //color: Colors.amberAccent,
        height: double.infinity,
        child: FirebaseAnimatedList(
            query: ref,
            itemBuilder: ((context, snapshot, animation, index) {
              Map patient = snapshot.value as Map;
              patient['key'] = snapshot.key;
              return boxList(patient);
            })),
      ),
    );
  }
}
