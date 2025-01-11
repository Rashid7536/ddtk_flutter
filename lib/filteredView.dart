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
    // dynamic ListSorted = [];

    // int countAPOS = 0;
    // int? whyCount;
    // int counted = 0;

    bubbleSort(List array) {
      int lengthOfArray = array.length;
      for (int i = 0; i < lengthOfArray - 1; i++) {
        print('Index i at pos: ${i}');
        for (int j = 0; j < lengthOfArray - i - 1; j++) {
          print('loop:${i}');
          print('index i and j at pos: ${i}  &  ${j}');

          if (array[j][0] > array[j + 1][0]) {
            // Swapping using temporary variable
            int temp = array[j];
            array[j] = array[j + 1];
            array[j + 1] = temp;

            print(
                'element at pos j and j+1 after swap: ${array[j]} & ${array[j + 1]}');
          }
        }
      }
      return (array);
    }

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
            itemBuilder: ((context, snapshot, animation, index) {
              Map patient = snapshot.value as Map;

              //BLOODY A
              if (widget.blood == 'A') {
                if (widget.pra == 'praPos') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'A' && (PRA != null && PRA != '0' && PRA != 'ND')) {
                    // print('Patient: ' + patient.toString());
                    // print(BG.toString());
                    // print(PRA.toString());
                    // print('Counted: ' + counted.toString());
                    String Score = collectedScore(patient);
                    int parsedScore = 0;
                    if (Score != 'N/A') {
                      //parse score
                      parsedScore = int.parse(Score);
                    } else {
                      parsedScore = 1;
                    }

                    ListCollected.add([parsedScore, patient]);
                    counter++;
                    //bubbleSort(pas)
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
                  }
                }
                if (widget.pra == 'praNeg') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'A' && PRA == '0') {
                    print(BG.toString());
                    print(PRA.toString());
                    //patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
                  }
                }
                if (widget.pra == 'praUnDef') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'A' && PRA == 'ND') {
                    print(BG.toString());
                    print(PRA.toString());
                    //patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
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
                    //patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
                  }
                }
                if (widget.pra == 'praNeg') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'B' && PRA == '0') {
                    print(BG.toString());
                    print(PRA.toString());
                    //patient['key'] = snapshot.key;

                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
                  }
                }
                if (widget.pra == 'praUnDef') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'B' && PRA == 'ND') {
                    print(BG.toString());
                    print(PRA.toString());
                    //patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
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
                    //patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
                  }
                }
                if (widget.pra == 'praNeg') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'AB' && PRA == '0') {
                    print(BG.toString());
                    print(PRA.toString());
                    //patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
                  }
                }
                if (widget.pra == 'praUnDef') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'AB' && PRA == 'ND') {
                    print(BG.toString());
                    print(PRA.toString());
                    //patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
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
                    //patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
                  }
                }
                if (widget.pra == 'praNeg') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'O' && PRA == '0') {
                    print(BG.toString());
                    print(PRA.toString());
                    ////patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
                  }
                }
                if (widget.pra == 'praUnDef') {
                  dynamic BG = patient['BG'];
                  dynamic PRA = patient['PRA'];
                  if (BG == 'O' && PRA == 'ND') {
                    print(BG.toString());
                    print(PRA.toString());
                    //patient['key'] = snapshot.key;
                    return boxList(patient);
                  } else {
                    return SizedBox.shrink();
                  }
                }
              }
              return SizedBox.shrink();
              // ////patient['key'] = snapshot.key;
            })),
      ),
    );
  }
}
