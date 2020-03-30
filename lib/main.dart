import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Sales {
  String year;
  int sales;

  Sales(this.year, this.sales);
}

class _State extends State<MyApp> {

  List<Sales> data;
  List<charts.Series<Sales, String>> chartdata;
  
  void makeData() {
    data = new List<Sales>();
    chartdata = List<charts.Series<Sales, String>>();
    
    final rnd = new Random();
    for(int i = 2010; i< 2019; i++) {
      data.add(new Sales(i.toString(), rnd.nextInt(1000)));
    }

    chartdata.add(new charts.Series(
      id: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
      data: data,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      fillPatternFn: (_,__) => charts.FillPatternType.solid,
      displayName: 'sales'
      )
    );
  }

  @override
  void initState() {
    makeData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Charts'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Sales data'),
              new Expanded(child: new charts.BarChart(chartdata))
            ]
          ),
        ),
      ),
    );
  }
}