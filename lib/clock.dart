import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  @override
  ClockState createState() => new ClockState();
}

class ClockState extends State<Clock> {

  String value = 'Time here';
  Timer timer;


  @override
  void initState() {
    timer = new Timer.periodic(new Duration(seconds: 1), onTimer);
  }

  void onTimer(Timer timer) {
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm:ss');
    String formatted = formatter.format(now);

    setState(() => value = formatted  );
  }

  @override
  Widget build(BuildContext context) {
    return new Text(value, style: new TextStyle(fontSize: 32.0));
  }
}