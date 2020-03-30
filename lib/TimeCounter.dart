import 'package:flutter/material.dart';
import 'dart:async';
import 'timedisplay.dart';

class TimeCounter extends StatefulWidget {
  @override
  TimeCounterState createState() => new TimeCounterState();
}

class TimeCounterState extends State<TimeCounter> {

  Stopwatch watch;
  Timer timer;
  Duration duration;

  void onStart() {
    setState(() {
      watch = new Stopwatch();
      timer = new Timer.periodic(new Duration(milliseconds: 250), onTimeOut);
    });
    watch.start();
  }

  void onStop() {
    timer.cancel();
    watch.stop();
  }

  void onTimeOut(Timer timer) {
    if(!watch.isRunning) return;
    setState(() => duration = watch.elapsed);
  }

  void onClear(Duration value) {
    setState(() => duration = new Duration());
  }


  @override
  void initState() {
    duration = new Duration();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new TimeDisplay(
              color: Colors.red,
              duration: duration,
              onClear: onClear,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new RaisedButton(
                    onPressed: onStart,
                    child: new Text('Start')
                  )
                ),
                new Padding(
                    padding: new EdgeInsets.all(10.0),
                    child: new RaisedButton(
                        onPressed: onStop,
                        child: new Text('Stop')
                    )
                )
              ],
            )
          ],
        )
      )
    );
  }
}