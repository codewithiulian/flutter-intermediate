import 'package:flutter/material.dart';
import '../code/GlobalState.dart';

class Second extends StatefulWidget {
  Second(this.name);
  String name;

  @override
  _SecondState createState() => new _SecondState(name);
}

class _SecondState extends State<Second> {

  _SecondState(this.name);
  String name;

  GlobalState _store = GlobalState.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Page'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Hello $name'),
              new RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Third');
                  },
                  child: new Text('Next')
              ),
              new RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Home');
                  },
                  child: new Text('Back')
              ),
            ]
          ),
        ),
      ),
    );
  }
}