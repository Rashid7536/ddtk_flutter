import 'furtherDetails.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class boxList extends StatelessWidget {
  Map patientMap;
  //Dynamic patientName = patientMap['name'];
  boxList(this.patientMap);

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

    try {
      return Center(
        child: Container(
          width: 350,

          //height: double.infinity,
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => furtherDetails(patientMap)));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 20,
              //color: Color.fromARGB(255, 234, 210, 238),

              child: Text(
                  "\nPatient: " +
                      patientMap['Name'] +
                      "\n" +
                      "Full Score: " +
                      FullScore.toString() +
                      "\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
            ),
          ),
        ),
      );
    } catch (e) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
