import '_listBox.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class filteredView extends StatefulWidget {
  final String blood;
  final String pra;
  filteredView(this.pra, this.blood, {super.key});

  @override
  State<filteredView> createState() => _filteredViewState();
}

class _filteredViewState extends State<filteredView> {
  Query ref = FirebaseDatabase.instance.ref().child('patientdata');
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    //VAR
    dynamic ListCollected = [];

    String collectedScore(Map patientMap) {
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
      return FullScore;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('View Page'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        //color: Colors.amberAccent,
        height: double.infinity,
        child: FirebaseAnimatedList(
            defaultChild: Center(child: CircularProgressIndicator()),
            query: ref,
            itemBuilder: ((context, snapshot, animation, index1) {
              Map patient = snapshot.value as Map;

              //BLOODY A -D
              if (widget.blood == 'A') {
                if (widget.pra == 'praPos') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'A' && (PRA != null && PRA != '0' && PRA != 'ND')) {
                    // print('Patient: ' + patient.toString());
                    // print(BG.toString());
                    // print(PRA.toString());
                    // print('Counted: ' + counted.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
                if (widget.pra == 'praNeg') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'A' && PRA == '0') {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
                if (widget.pra == 'praUnDef') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'A' && PRA == 'ND') {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
              }

              //BLOOD B
              if (widget.blood == 'B') {
                if (widget.pra == 'praPos') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'B' && (PRA != null && PRA != '0' && PRA != 'ND')) {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
                if (widget.pra == 'praNeg') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'B' && PRA == '0') {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
                if (widget.pra == 'praUnDef') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'B' && PRA == 'ND') {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
              }

              //BLOODY AB
              if (widget.blood == 'AB') {
                if (widget.pra == 'praPos') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'AB' &&
                      (PRA != null && PRA != '0' && PRA != 'ND')) {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
                if (widget.pra == 'praNeg') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'AB' && PRA == '0') {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
                if (widget.pra == 'praUnDef') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'AB' && PRA == 'ND') {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
              }

              //BLOODY O
              if (widget.blood == 'O') {
                if (widget.pra == 'praPos') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'O' && (PRA != null && PRA != '0' && PRA != 'ND')) {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
                if (widget.pra == 'praNeg') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'O' && PRA == '0') {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
                if (widget.pra == 'praUnDef') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'O' && PRA == 'ND') {
                    print(BG.toString());
                    print(PRA.toString());
                    String score = collectedScore(patient);
                    int parsedScore = score != 'N/A' ? int.parse(score) : 1;
                    ListCollected.add([parsedScore, patient]);
                  }
                }
              }

              // ////patient['key'] = snapshot.key;

              ListCollected.forEach((key, value) {
                print(value.toString());
                return boxList(value);
              });

              if (index1 == snapshot.children.length - 1) {
                // Sorting list at the end of the list build process
                ListCollected.sort(
                    (a, b) => (b[0] as int).compareTo(a[0] as int));
                print('THE LIST: ' + ListCollected.toString());
                //for(int x=0;x<ListCollected[])

                return SizedBox.shrink();
                //   },
                // return ListView.builder(
                //   shrinkWrap: true,
                //   // physics: NeverScrollableScrollPhysics(),
                //   itemCount: ListCollected.length,
                //   itemBuilder: (context, index) {
                //     print('THE LIST BUILT: ' +
                //         ListCollected[index][1].toString());
                //     return boxList(ListCollected[index][1]);
                //   },
                // );
              } else {
                return SizedBox.shrink();
              }
            })),
      ),
    );
  }
}
