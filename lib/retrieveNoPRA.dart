import 'listBoxPRA.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class PRAret extends StatefulWidget {
  const PRAret({super.key});

  @override
  State<PRAret> createState() => _PRAretState();
}

class _PRAretState extends State<PRAret> {
  int countE = 0;
  Query ref = FirebaseDatabase.instance.ref().child('patientdata');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PRA Adder"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          defaultChild: Center(
            child: CircularProgressIndicator(),
          ),
          query: ref,
          itemBuilder: ((context, snapshot, animation, index) {
            Map patient = snapshot.value as Map;
            dynamic PRAExists = patient['PRA'];

            //print(bloodGroupExits);
            //patient['key'] = snapshot.key;
            if (PRAExists == null || PRAExists == "" || PRAExists == "ND") {
              Map patientPRA = snapshot.value as Map;
              countE++;
              //print(bloodGroupExits);
              return boxListPRA(patientPRA);
            } else {
              return SizedBox.shrink();
            }
          }),
        ),
      ),
    );
  }
}
