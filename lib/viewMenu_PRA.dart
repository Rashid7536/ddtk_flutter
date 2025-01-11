import 'filteredView%20copy.dart';
import 'package:flutter/material.dart';

class viewMenuPRA extends StatefulWidget {
  final String bG;
  const viewMenuPRA(this.bG, {super.key});

  @override
  State<viewMenuPRA> createState() => _viewMenuPRAState();
}

class _viewMenuPRAState extends State<viewMenuPRA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select PRA'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(children: [
          //Blood Group PRA+
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FilteredView2('praPos', widget.bG)));
              },
              child: Text('PRA +')),

          //Blood Group PRA-
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FilteredView2('praNeg', widget.bG)));
              },
              child: Text('PRA -')),

          //Blood Group NoPRA
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        FilteredView2('praUnDef', widget.bG)));
              },
              child: Text('Unclassified PRA')),

          Padding(padding: EdgeInsets.all(10)),
        ]),
      ),
    );
  }
}
