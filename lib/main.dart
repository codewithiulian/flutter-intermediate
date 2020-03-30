import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

enum Animals{Cat, Dog, Bird, Lizard, Fish}

class _State extends State<MyApp> {

  Animals selectedAnimal = Animals.Cat;
  String value = 'Make a selection';
  List<PopupMenuEntry<Animals>> animals = new List<PopupMenuEntry<Animals>>();


  @override
  void initState() {
    for(Animals animal in Animals.values) {
      animals.add(new PopupMenuItem(
        child: new Text(getDisplay(animal)),
        value: animal
      ));
    }
  }

  void onSelected(Animals animal) {
    setState(() {
      selectedAnimal = animal;
      var displayString = getDisplay(animal);
      value = 'You selected $displayString';
    });
  }

  String getDisplay(Animals animal) {
    int index = animal.toString().indexOf('.');
    index++;

    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Widgets'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(5.0),
                child: new Text(value)
              ),
              new PopupMenuButton<Animals>(
                child: new Icon(Icons.input),
                initialValue: Animals.Cat,
                onSelected: onSelected,
                itemBuilder: (BuildContext context) {
                  return animals;
                },
              )
            ]
          ),
        ),
      ),
    );
  }
}