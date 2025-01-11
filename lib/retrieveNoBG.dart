import 'listBoxBG.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class BGret extends StatefulWidget {
  const BGret({super.key});

  @override
  State<BGret> createState() => _BGretState();
}

class _BGretState extends State<BGret> {
  int countE = 0;
  // int countNE = 0;
  Query ref = FirebaseDatabase.instance.ref().child('patientdata');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Group Adder"),
        backgroundColor: Colors.amber,
      ),
      //if (count){}
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: ((context, snapshot, animation, index) {
            Map patient = snapshot.value as Map;

            dynamic bloodGroupExits = patient['BG'];
            if (bloodGroupExits == null || bloodGroupExits == "") {
              Map patientBG = snapshot.value as Map;
              countE++;
              //print(bloodGroupExits);
              return boxListBG(patientBG);
            } else {
              //countE++;
              return SizedBox.shrink();
            }
          }),
        ),
      ),
    );
  }
}
