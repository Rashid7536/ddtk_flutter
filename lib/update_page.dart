import '../database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class update_p extends StatefulWidget {
  const update_p({super.key});

  @override
  State<update_p> createState() => _update_pState();
}

class _update_pState extends State<update_p> {
  final ref = FirebaseDatabase.instance.ref();
  final nameControl = TextEditingController();
  final idControl = TextEditingController();
  final dobControl = TextEditingController();
  final sexControl = TextEditingController();
  final eControl = TextEditingController();
  final telControl = TextEditingController();
  final provControl = TextEditingController();
  final cityControl = TextEditingController();
  //final ListMF<DropdownMenuEntry> = ["Male","Female"];
  final data_class = Database_mthds();
  DateTime DateClass = DateTime.now();
  //int YearNow = 1;

  // void disposeTextB() {
  // nameControl.dispose();
  //  super.dispose();
  //}

  @override
  Widget build(BuildContext context) {
    //String Name, city, prov, sex, dob, email, tel;
    int YearNow = DateClass.year;
    //DateTime pickedDate = DateTime.now();
    return Scaffold(
        appBar: AppBar(title: Text('Update Your Data')),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 300,
              //height: 500,
              child: Column(children: [
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "National ID: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    controller: idControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     National ID",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                    onPressed: () async {
                      String keyGot = 'notYet';

                      dynamic dataret = await ref.child('patientdata').get();
                      final json_pd = dataret.value;
                      json_pd.forEach((key, value) {
                        if (value['NID'] == idControl.text) {
                          keyGot = key;
                        }
                      });
                      //print('1 Received');
                      //print('this is key From update Page ' + keyGot);
                      String keyF = keyGot.toString();
                      dynamic fetchedD =
                          await ref.child('patientdata').child(keyF).get();
                      //print(keyF);
                      //print(fetchedD.value);
                      try {
                        nameControl.text = fetchedD.value['Name'];
                        idControl.text = fetchedD.value['NID'];
                        dobControl.text = fetchedD.value['DOB'];
                        telControl.text = fetchedD.value['Phone'];
                        eControl.text = fetchedD.value['Email'];
                        cityControl.text = fetchedD.value['Place'];
                        provControl.text = fetchedD.value['Province'];
                        sexControl.text = fetchedD.value['Sex'];
                        print(fetchedD.value['Place'].toString());
                        if (telControl.text == "") {
                          telControl.text = 'N/A';
                        }
                        if (dobControl.text == "") {
                          dobControl.text = 'N/A';
                        }
                        if (eControl.text == "") {
                          eControl.text = 'N/A';
                        }
                        if (cityControl.text == "") {
                          cityControl.text = 'N/A';
                        }
                        if (provControl.text == "") {
                          provControl.text = 'N/A';
                        }
                        if (sexControl.text == "") {
                          sexControl.text = 'N/A';
                        }
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: "ID not found or Invalid ID");
                      }

                      //fillData(keyGot);
                    },
                    child: Text("Fetch Data From ID")),
                //Padding(padding: EdgeInsets.all(20)),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "Name: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    controller: nameControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "Date of Birth: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    //errorInvalidText: "Invalid Date",
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(YearNow + 10),
                        initialDate: DateTime.now(),
                      ).then((date) {
                        setState(() {
                          String FormatDate =
                              DateFormat("d" + "/" + "M" + "/" + "y")
                                  .format(date!);
                          dobControl.text = FormatDate;
                        });
                      });
                    },
                    //inputFormatters: [ InputDatePickerFormField(firstDate: 01/01/1900, lastDate: lastDate)],
                    // onChanged: (value) {
                    //   dobControl.text = pickedDate as String;
                    //   print(pickedDate);
                    // },

                    keyboardType: TextInputType.datetime,
                    controller: dobControl,

                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Date of Birth",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "Telephone No: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    controller: telControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Telephone No",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(8)),
                Column(children: [
                  Text(
                    "Email: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: eControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "City: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    controller: cityControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     City",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "Province: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  TextField(
                    controller: provControl,
                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        //hintText: "Username",
                        labelText: "     Province",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ]),
                Padding(padding: EdgeInsets.all(10)),
                Column(children: [
                  Text(
                    "Sex: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  DropdownMenu(
                    controller: sexControl,
                    dropdownMenuEntries: <DropdownMenuEntry>[
                      DropdownMenuEntry(value: "1", label: "Male"),
                      DropdownMenuEntry(value: "2", label: "Female")
                    ],
                    onSelected: (value) {
                      setState(() {
                        if (value == "1") {
                          sexControl.text = "Male";
                        } else {
                          sexControl.text = "Female";
                        }
                      });
                    },
                    label: Text("    Select Gender"),
                    width: 300,
                    inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  ElevatedButton(
                      onPressed: () {
                        if (nameControl.text == "" ||
                                idControl.text == "" ||
                                sexControl.text == "" ||
                                telControl.text == ""
                            //eControl.text == "" ||
                            //cityControl.text == "" ||
                            //provControl.text == ""
                            ) {
                          Fluttertoast.showToast(
                              msg: "Fill All Fields",
                              gravity: ToastGravity.CENTER);
                          //print("FILL");
                        } else if (eControl.text == "" ||
                            !eControl.text.contains('@') ||
                            !eControl.text.contains(".")) {
                          Fluttertoast.showToast(
                              msg: "INVALID EMAIL TYPE",
                              gravity: ToastGravity.CENTER);
                        }

                        // }
                        else {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Data Confirmation'),
                                  content: SingleChildScrollView(
                                    child: ListBody(children: [
                                      Text('Name: ' + nameControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('IDNo.: ' + idControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Date of Birth: ' + dobControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Telephone.: ' + telControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Email: ' + eControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('City: ' + cityControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Province: ' + provControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      Text('Sex: ' + sexControl.text),
                                      Padding(padding: EdgeInsets.all(10)),
                                      ElevatedButton(
                                          onPressed: () async {
                                            //add the function firebase.push()
                                            String keyGot = 'notYet';
                                            dynamic dataret = await ref
                                                .child('patientdata')
                                                .get();
                                            final json_pd = dataret.value;
                                            json_pd.forEach((key, value) {
                                              if (value['NID'] ==
                                                  idControl.text) {
                                                keyGot = key;
                                              }
                                            });
                                            data_class.updateData(
                                                keyGot,
                                                nameControl.text,
                                                idControl.text,
                                                dobControl.text,
                                                telControl.text,
                                                eControl.text,
                                                cityControl.text,
                                                provControl.text,
                                                sexControl.text);
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Confirm')),
                                      Padding(padding: EdgeInsets.all(10)),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancel'))
                                    ]),
                                  ),
                                );
                              });
                        }
                        ;
                      },
                      child: Text("Submit Data")),
                  Padding(padding: EdgeInsets.all(30)),
                  //ElevatedButton(onPressed: () {}, child: Text("Sign Up"))
                ]),
              ]),
            ),
          ),
        ));
  }
}
