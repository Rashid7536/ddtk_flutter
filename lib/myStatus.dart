import 'package:flutter/material.dart';

// ignore: must_be_immutable
class myStatus extends StatefulWidget {
  String KeyFound;
  Map Ret;
  myStatus(this.KeyFound, this.Ret);

  @override
  State<myStatus> createState() => _myStatusState();
}

class _myStatusState extends State<myStatus> {
  @override
  Widget build(BuildContext context) {
    //3final currentUser = FirebaseAuth.instance.currentUser;
    //final emailRet = currentUser!.email;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Status"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Text("Name: " + widget.Ret['Name'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("IDno.: " + widget.Ret['NID'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            Text("Date of Birth: " + widget.Ret['DOB'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
            //Padding(padding: EdgeInsets.all(5)),
            Text("Dialysis Date: " + "widget.Ret['DDate']",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(padding: EdgeInsets.all(5)),
          ],
        ),
      ),
    );
  }
}
