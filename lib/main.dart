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

class Item {
  bool isExpanded;
  final String header;
  final Widget body;

  Item(this.isExpanded, this.header, this.body);
}

class _State extends State<MyApp> {

  List<Item> items = new List<Item>();


  @override
  void initState() {
    for(int i = 1; i <= 10; i++) {
      items.add(new Item(
        false,
        'Item $i',
        new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Text('Description of item $i')
          )
        )
      );
    }
  }

  ExpansionPanel createItem(Item item) {
    return new ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return new Container(
          padding: EdgeInsets.all(5.0),
          child: new Text('Header ${item.header}')
        );
      },
      body: item.body,
      isExpanded: item.isExpanded
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
        child: new ListView(
          children: <Widget>[
            new ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  items[index].isExpanded = !items[index].isExpanded;
                });
              },
              children: items.map(createItem).toList(),
            )
          ],
        )
      ),
    );
  }
}