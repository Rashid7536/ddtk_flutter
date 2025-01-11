import 'listBoxStatus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class STAret extends StatefulWidget {
  const STAret({super.key});

  @override
  State<STAret> createState() => _STAretState();
}

class _STAretState extends State<STAret> {
  int countE = 0;
  Query ref = FirebaseDatabase.instance.ref().child('patientdata');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status Updater"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: ref,
          defaultChild: Center(
            child: CircularProgressIndicator(),
          ),
          itemBuilder: ((context, snapshot, animation, index) {
            Map patient = snapshot.value as Map;
            dynamic STAExists = patient['Status'];
            //print(bloodGroupExits);
            //patient['key'] = snapshot.key;
            if (STAExists == null ||
                STAExists == "" ||
                STAExists == "Pending.." ||
                STAExists == "Pending") {
              Map patientSTA = snapshot.value as Map;
              countE++;
              //print(bloodGroupExits);
              return boxListSTA(patientSTA);
            } else {
              return SizedBox.shrink();
            }
          }),
        ),
      ),
    );
  }
}
