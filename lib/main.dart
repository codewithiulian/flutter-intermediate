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

  double selectedValue = 0.0;

  void sliderOnChanged(double _value) => setState(() => selectedValue = _value);

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
              new Slider(
                value: selectedValue,
                onChanged: sliderOnChanged,
              ),
              new Container(
                padding: new EdgeInsets.all(32.0),
                child: new LinearProgressIndicator(
                  value: selectedValue,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
                ),
              ),
              new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new CircularProgressIndicator(
                    value: selectedValue,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
                  )
              ),
            ],
          )
        )
      ),
    );
  }
}