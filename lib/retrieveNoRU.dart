import 'listBoxRU.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RUret extends StatefulWidget {
  const RUret({super.key});

  @override
  State<RUret> createState() => _RUretState();
}

class _RUretState extends State<RUret> {
  int countE = 0;
  Query ref = FirebaseDatabase.instance.ref().child('patientdata');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RU Adder"),
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
            dynamic RUExists = patient['RU'];
            //print(bloodGroupExits);
            //patient['key'] = snapshot.key;
            if (RUExists == null || RUExists == "") {
              Map patientRU = snapshot.value as Map;
              countE++;
              //print(bloodGroupExits);
              return boxListRU(patientRU);
            } else {
              return SizedBox.shrink();
            }
          }),
        ),
      ),
    );
  }
}
