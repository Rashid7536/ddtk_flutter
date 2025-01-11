import 'editDetails/details_addBG.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class boxListBG extends StatelessWidget {
  Map patientMap;
  //Dynamic patientName = patientMap['name'];
  boxListBG(this.patientMap);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,

        //height: double.infinity,
        padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => detailsBG(patientMap)));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 20,
            child: Text("\nPatient: " + patientMap['Name'] + "\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
          ),
        ),
      ),
    );
  }
}
