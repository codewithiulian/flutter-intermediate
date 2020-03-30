import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp()
  ));
}

class MyApp extends StatefulWidget {

  @override
  State createState() => new _State();
}

class _State extends State<MyApp> {

  int counter = 0;
  List<Widget> widgetsList = new List<Widget>();


  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = newItem(i); // Create a new child using this method.
      widgetsList.add(child); // Add it to the widgets list.
    }
  }

  void addBtnOnPressed() {
    // When add button is presesed
    Widget child = newItem(counter); // Add a new item usign the global counter.
    setState(() => widgetsList.add(child));
  }

  Widget newItem(int i) {
    Key key = new Key('item_$i'); // Create the widget key (map identifier)
    Container child = new Container(
      key: key,
      child: new Chip(
        label: new Text('Item number $i'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => removeItem(key),
        avatar: new CircleAvatar(
          backgroundColor: Colors.indigo.shade400,
          child: new Text('$i')
        ),
      ),
    );

    counter++;
    return child;
  }

  void removeItem(Key key) {
    for (int i = 0; i < widgetsList.length; i++) {
      Widget child = widgetsList.elementAt(i);

      if(child.key == key) { // If the key exists.
        // Remove the widget at that key.
        setState(() => widgetsList.removeAt(i));
        print('Removing $key');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Widgets')
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: addBtnOnPressed,
        child: new Icon(Icons.add)
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: widgetsList
          )
        )
      ),
    );
  }
}