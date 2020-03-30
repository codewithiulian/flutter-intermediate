import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Area {
  int index;
  String name;
  Color color;

  Area({this.index: -1, this.name: 'Area', this.color: Colors.lightBlueAccent});
}

class _State extends State<MyApp> {

  int location;
  List<Area> areas;


  @override
  void initState() {
    areas = new List<Area>();
    for(int i = 1; i <= 16; i++) {
      areas.add(new Area(index: i, name:'Area $i'));
    }

    var rng = new Random();
    location = rng.nextInt(areas.length);
    print('Hint: Area ${location+1}');
  }

  Widget generate(int index) {
    return new GridTile(
      child: new Container(
        padding: new EdgeInsets.all(5.0),
        child: new RaisedButton(
          onPressed: () => onPressed(index),
          color: areas[index].color,
          child: new Text(areas[index].name, textAlign: TextAlign.center),
        )
      )
    );
  }

  void onPressed(int index) {
    setState(() {
      if(index == location) {
        areas[index].color = Colors.green;
      }else{
        areas[index].color = Colors.red;
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new GridView.count(
            crossAxisCount: 4,
            children: new List<Widget>.generate(areas.length, generate)
          )
        ),
      ),
    );
  }
}