import 'addPatient.dart';
import 'dataEntry_p.dart';
import '../database.dart';
import 'myStatus.dart';
import 'reviewPage.dart';
import 'update_page.dart';
import 'viewMenu_B.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class home_p extends StatefulWidget {
  const home_p({super.key});

  @override
  State<home_p> createState() => _home_pState();
}

class _home_pState extends State<home_p> {
  final ref = FirebaseDatabase.instance.ref();

  final data_m = Database_mthds();
  @override
  Widget build(BuildContext context) {
    //String found;
    final cUser = FirebaseAuth.instance.currentUser;
    final emailRet = cUser!.email;

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text("Menu"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () async {
                    int FoundSU = 1;
                    int FoundU = 1;
                    dynamic dataSU = await ref.child('superuser').get();
                    dynamic dataU = await ref.child('patientdata').get();
                    final json_pd_su = dataSU.value;
                    final json_pd_u = dataU.value;

                    json_pd_su.forEach((key, value) {
                      if (value['userName'] == emailRet) {
                        FoundSU = 2;
                        //print("Found: "+FoundSU.toString());
                      }
                    });

                    json_pd_u.forEach((key, value) {
                      if (value['Email'] == emailRet) {
                        FoundU = 2;
                        print("Found: " + FoundU.toString());
                      }
                    });

                    if (FoundSU == 2) {
                      Fluttertoast.showToast(msg: "You are a Super User");
                      print("FoundSU");
                    } else if (FoundU == 2) {
                      Fluttertoast.showToast(
                          msg: "You are a already registered");
                      print("FoundU");
                    } else if (FoundSU != 2 || FoundU != 2) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => dataEntry_p()));
                      print("Not Found");
                    }

                    FoundSU = 1;
                    FoundU = 1;
                  },
                  child: Text("Register")),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  statesController: MaterialStatesController(),
                  onPressed: () async {
                    //bool isOld = false;
                    bool isSU = false;
                    bool isNEW = false;
                    Map valueRet = {"": ""};
                    String? keyF;
                    //String found = "Why";
                    dynamic dataPatient = await ref.child('patientdata').get();
                    dynamic dataSU = await ref.child('superuser').get();

                    //dynamic dataU = await ref.child('users').get();
                    final json_pd_pat = dataPatient.value;
                    final json_pd_su = dataSU.value;
                    //final json_pd_u = dataU.value;

                    json_pd_pat.forEach((key, value) {
                      if (value['Email'] == emailRet) {
                        //found ="Data Found";
                        isNEW = true;
                        keyF = key;
                        valueRet = value;
                      }
                    });
                    json_pd_su.forEach((key, value) {
                      if (value['Email'] == emailRet) {
                        //found ="Data Found";
                        isSU = true;
                      }
                    });

                    if (isSU == true) {
                      Fluttertoast.showToast(msg: "You are a Super User");
                    } else if (isNEW == true) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              myStatus(keyF.toString(), valueRet)));
                    } else {
                      Fluttertoast.showToast(
                        msg:
                            "My status is only for newly registered/updated data with email memebers",
                      );
                    }
                    //found = "Why";
                    isNEW = false;
                    isSU = false;
                  },
                  child: Text('My Status')),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => viewMenuB()));
                  },
                  child: Text('View List')),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => addPatient()));
                  },
                  child: Text("Add Patients")),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => update_p()));
                  },
                  child: Text("Update Details")),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () async {
                    dynamic dataSU = await ref.child('superuser').get();
                    //dynamic dataPU = await ref.child('powerusers').get();
                    final dataSU_JSON = dataSU.value;
                    String SU = '';
                    dataSU_JSON.forEach((key, value) {
                      if (value['userName'] == emailRet) {
                        SU = 'Yes';
                      }
                    });

                    if (SU == 'Yes') {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => reveiewPage()));
                    } else {
                      Fluttertoast.showToast(msg: 'Not a SuperUser');
                    }
                    SU = '';
                  },
                  child: Text("Review and Approve")),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'No Notices available!');
                  },
                  child: Text("Notices")),
              Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        ),
      ),
      // Text(data_m.getDetails()),
    );
  }
}
