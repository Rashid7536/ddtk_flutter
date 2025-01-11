// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class furtherDetails extends StatelessWidget {
  Map patientMap;
  furtherDetails(this.patientMap);

  @override
  Widget build(BuildContext context) {
    String FullScore;
    try {
      //GET DATA FROM DB
      String DOBpat = patientMap['DOB'];
      String DiaDate = patientMap['DDate'];

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

    String BG = patientMap['BG'].toString();
    String PRA = patientMap['PRA'].toString();
    String RU = patientMap['RU'].toString();
    String STA = patientMap['Status'].toString();
    String EMAIL = patientMap['Email'].toString();
    String PROV = patientMap['Province'].toString();
    String CITY = patientMap['Place'].toString();

    // print("PRA: "+PRA.toString());
    // print("BG: "+BG.toString());

    if (BG == "null" || BG == "") {
      BG = "N/A";
    }
    if (PRA == "null" || PRA == "") {
      PRA = "N/A";
    }
    if (RU == "null" || RU == "") {
      RU = "N/A";
    }
    if (STA == "null" || STA == "") {
      STA = "N/A";
    }
    if (EMAIL == "null" || EMAIL == "") {
      EMAIL = "N/A";
    }
    if (PROV == "null" || PROV == "") {
      PROV = "N/A";
    }
    if (CITY == "null" || CITY == "") {
      CITY = "N/A";
    }

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
            Text("Name: " + patientMap['Name'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Patient Score " + FullScore,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Padding(padding: EdgeInsets.all(5)),
            Text("IDno.: " + patientMap['NID'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Date of Birth: " + patientMap['DOB'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            //Padding(padding: EdgeInsets.all(5)),
            Text("Dialysis Date: " + patientMap['DDate'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Blood Group: " + BG,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("PRA: " + PRA + " %",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("RU: " + RU,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Status: " + STA,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Sex: " + patientMap['Sex'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Telephone: " + patientMap['Phone'],
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
          ],
        ),
      )),
    );
  }
}
