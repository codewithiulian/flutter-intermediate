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
  String headingValue = '';

  void iconOnPressed() => setState(() => {
    headingValue = DateTime.now().toString()
  });

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Widgets')
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(headingValue),
              new IconButton(
                icon: new Icon(Icons.timer),
                onPressed: iconOnPressed,
                tooltip: 'Tap me',
              )
            ]
          )
        )
      ),
    );
  }
}