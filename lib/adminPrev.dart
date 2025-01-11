import 'package:flutter/material.dart';

class adminPrev extends StatefulWidget {
  const adminPrev({super.key});

  @override
  State<adminPrev> createState() => _adminPrevState();
}

class _adminPrevState extends State<adminPrev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Management")),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(onPressed: () {
                //Navigator.of(context).push(MaterialPageRoute(builder:   (context) => ));
              }, child: Text("Super Users")),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(onPressed: () {
                //Navigator.of(context).push(MaterialPageRoute(builder:   (context) => ));
              }, child: Text("Users")),
              Padding(padding: EdgeInsets.all(10)),
              
          ],
        ),
      ),
    );
  }
}