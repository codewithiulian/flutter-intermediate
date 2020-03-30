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

  List<Sales> laptops;
  List<Sales> desktops;
  List<charts.Series<Sales, String>> chartdata;
  
  void makeData() {
    laptops = new List<Sales>();
    desktops = new List<Sales>();
    chartdata = new List<charts.Series<Sales, String>>();

    final rdm = new Random();
    for(int i = 2016; i < 2019; i++) {
      laptops.add(new Sales(i.toString(), rdm.nextInt(1000)));
      desktops.add(new Sales(i.toString(), rdm.nextInt(1000)));
    }

    chartdata.add(new charts.Series(
      id: 'Sales',
      data: laptops,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      displayName: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
    )
    );

    chartdata.add(new charts.Series(
      id: 'Sales',
      data: desktops,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      displayName: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
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
              new Expanded(
                child: new charts.BarChart(chartdata, vertical: false,))
            ]
          ),
        ),
      ),
    );
  }
}