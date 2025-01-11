// ignore_for_file: must_be_immutable

import '../database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class detailsBG extends StatefulWidget {
  Map patientMap;
  detailsBG(this.patientMap);

  @override
  State<detailsBG> createState() => _detailsBGState();
}

class _detailsBGState extends State<detailsBG> {
  final BGcontrol = TextEditingController();
  final ref = FirebaseDatabase.instance.ref();
  final data_class = Database_mthds();
  @override
  Widget build(BuildContext context) {
    String FullScore;
    //final dateJan = DateTime(dateNow.year,1,1);
    //String filteredDOB = DOBpat.replaceAll("/","-");
    try {
      //GET DATA FROM DB
      String DOBpat = widget.patientMap['DOB'];
      String DiaDate = widget.patientMap['DDate'];

      //CREATE DT NOW
      final dateNow = DateTime.now();

      //CREATE DT PATIENT DOB
      DateTime DOBpatParsed =
          DateFormat("d" + "/" + "M" + "/" + "y").parseStrict(DOBpat);

      //CREATE DT PATIENT DOB
      DateTime DiaDateParsed =
          DateFormat("d" + "/" + "M" + "/" + "y").parseStrict(DiaDate);

      //GET DIFFERENCE BETWEEN DIA DATE AND NOW
      Duration DiaDateNow = dateNow.difference(DiaDateParsed);

      //GET DIFFERENCE IN YEARS OF DOB AND NOW
      int getYearDifference = (dateNow.year - DOBpatParsed.year).abs();

      //Final Score
      FullScore = (DiaDateNow.inDays + (100 - getYearDifference)).toString();
    } catch (e) {
      FullScore = "N/A";
    }

    //String BG = widget.patientMap['BG'].toString();
    //String PRA = widget.patientMap['PRA'].toString();
    //String RU = widget.patientMap['RU'].toString();
    String EMAIL = widget.patientMap['Email'].toString();
    String PROV = widget.patientMap['Province'].toString();
    String CITY = widget.patientMap['Place'].toString();
    String PHONE = widget.patientMap['Phone'].toString();

    // print("PRA: "+PRA.toString());
    // print("BG: "+BG.toString());

    // if(BG == "null" || BG ==""){
    //   BG = "N/A";
    // }
    // if(PRA == "null" || PRA ==""){
    //   PRA = "N/A";
    // }
    // if(RU == "null" || RU ==""){
    //   RU = "N/A";
    // }
    if (EMAIL == "null" || EMAIL == "") {
      EMAIL = "N/A";
    }
    if (PROV == "null" || PROV == "") {
      PROV = "N/A";
    }
    if (CITY == "null" || CITY == "") {
      CITY = "N/A";
    }
    if (PHONE == "null" || PHONE == "" || PHONE == "0") {
      PHONE = "N/A";
    }
    //String name = patientMap['name'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Extra Details"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
          child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("Name: " + widget.patientMap['Name'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Patient Score " + FullScore.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Padding(padding: EdgeInsets.all(5)),
            Text("IDno.: " + widget.patientMap['NID'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Date of Birth: " + widget.patientMap['DOB'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Sex: " + widget.patientMap['Sex'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Telephone: " + PHONE,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Email: " + EMAIL,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("City: " + CITY,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Province: " + PROV,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            //Text( "--------------------------",textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.all(15)),
            Text(" Add Blood Group ",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Padding(padding: EdgeInsets.all(5)),
            DropdownMenu(
              controller: BGcontrol,
              dropdownMenuEntries: <DropdownMenuEntry>[
                DropdownMenuEntry(value: "1", label: "A"),
                DropdownMenuEntry(value: "2", label: "B"),
                DropdownMenuEntry(value: "3", label: "AB"),
                DropdownMenuEntry(value: "4", label: "O")
              ],
              onSelected: (value) {
                setState(() {
                  if (value == "1") {
                    BGcontrol.text = "A";
                  } else if (value == "2") {
                    BGcontrol.text = "B";
                  } else if (value == "3") {
                    BGcontrol.text = "AB";
                  } else if (value == "4") {
                    BGcontrol.text = "O";
                  }
                  // else{
                  //   BGcontrol.text = "B";
                  // }
                });
              },
              label: Text("    Select Blood Group"),
              width: 300,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
            Padding(padding: EdgeInsets.all(5)),
            ElevatedButton(
                onPressed: () async {
                  //print("BG: " + BGcontrol.text);
                  //print("PatKey " + widget.patientMap['key'].toString());
                  String keyGot = 'notYet';
                  dynamic dataret = await ref.child('patientdata').get();
                  final json_pd = dataret.value;
                  json_pd.forEach((key, value) {
                    if (value['NID'] == widget.patientMap['NID']) {
                      keyGot = key;
                    }
                  });
                  try {
                    if (BGcontrol.text != "") {
                      data_class.updateDataPRA(keyGot, BGcontrol.text);
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(msg: "Update Successful");
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Please Add Correct BG Value');
                    }
                  } catch (e) {
                    // TODO
                    Fluttertoast.showToast(
                        msg: 'Check Your Network Connection!');
                  }
                },
                child: Text("Confirm Blood Group"))
          ],
        ),
      )),
    );
  }
}
