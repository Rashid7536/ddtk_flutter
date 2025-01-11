import '_listBox.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilteredView2 extends StatefulWidget {
  final String blood;
  final String pra;
  FilteredView2(this.pra, this.blood, {super.key});

  @override
  State<FilteredView2> createState() => _FilteredView2State();
}

class _FilteredView2State extends State<FilteredView2> {
  Query ref = FirebaseDatabase.instance.ref().child('patientdata');
  List<dynamic> listCollected = [];

  @override
  void initState() {
    super.initState();
  }

  String collectedScore(Map patientMap) {
    String fullScore;
    try {
      //GET DATA FROM DB
      String dobPat = patientMap['DOB'];
      String diaDate = patientMap['DDate'];

      //CREATE DT NOW
      final dateNow = DateTime.now();

      //CREATE DT PATIENT DOB
      DateTime dobPatParsed = DateFormat("d/M/y").parseStrict(dobPat);

      //CREATE DT PATIENT DDATE
      DateTime diaDateParsed = DateFormat("d/M/y").parseStrict(diaDate);

      //GET DIFFERENCE BETWEEN DDATE AND NOW
      Duration diaDateNow = dateNow.difference(diaDateParsed);

      //GET DIFFERENCE IN YEARS OF DOB AND NOW
      int getYearDifference = (dateNow.year - dobPatParsed.year).abs();

      //Final Score
      fullScore = (diaDateNow.inDays + (100 - getYearDifference)).toString();
    } catch (e) {
      fullScore = "N/A";
    }
    return fullScore;
  }

  bool meetsCondition(Map patient) {
    dynamic bg = patient['BG'];
    dynamic pra = patient['PRA'];

    if (widget.blood == 'A') {
      if (widget.pra == 'praPos' &&
          bg == 'A' &&
          (pra != null && pra != '0' && pra != 'ND')) {
        return true;
      } else if (widget.pra == 'praNeg' && bg == 'A' && pra == '0') {
        return true;
      } else if (widget.pra == 'praUnDef' && bg == 'A' && pra == 'ND') {
        return true;
      }
    } else if (widget.blood == 'B') {
      if (widget.pra == 'praPos' &&
          bg == 'B' &&
          (pra != null && pra != '0' && pra != 'ND')) {
        return true;
      } else if (widget.pra == 'praNeg' && bg == 'B' && pra == '0') {
        return true;
      } else if (widget.pra == 'praUnDef' && bg == 'B' && pra == 'ND') {
        return true;
      }
    } else if (widget.blood == 'AB') {
      if (widget.pra == 'praPos' &&
          bg == 'AB' &&
          (pra != null && pra != '0' && pra != 'ND')) {
        return true;
      } else if (widget.pra == 'praNeg' && bg == 'AB' && pra == '0') {
        return true;
      } else if (widget.pra == 'praUnDef' && bg == 'AB' && pra == 'ND') {
        return true;
      }
    } else if (widget.blood == 'O') {
      if (widget.pra == 'praPos' &&
          bg == 'O' &&
          (pra != null && pra != '0' && pra != 'ND')) {
        return true;
      } else if (widget.pra == 'praNeg' && bg == 'O' && pra == '0') {
        return true;
      } else if (widget.pra == 'praUnDef' &&
          bg == 'O' &&
          (pra == 'ND' || pra == null)) {
        return true;
      }
    }
    return false;
  }

  Future<void> fetchData() async {
    DataSnapshot snapshot = await ref.get();
    if (snapshot.exists) {
      Map data = snapshot.value as Map;
      data.forEach((key, value) {
        if (meetsCondition(value)) {
          String score = collectedScore(value);
          int parsedScore = score != 'N/A' ? int.parse(score) : 1;
          listCollected.add([parsedScore, value]);
        }
      });
      listCollected.sort((a, b) => b[0].compareTo(a[0]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Page'),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (listCollected.isEmpty) {
            return Center(child: Text('No data found.'));
          } else {
            return ListView.builder(
              itemCount: listCollected.length,
              itemBuilder: (context, index) {
                return boxList(listCollected[index][1]);
              },
            );
          }
        },
      ),
    );
  }
}
