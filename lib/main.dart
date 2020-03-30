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

class _State extends State<MyApp> {

  List<Step> steps;
  int current;

  @override
  void initState() {
    current = 0;
    steps = <Step>[
      new Step(
          title: new Text('Step 1'),
          content: new Text('Do something for step 1'),
          isActive: true
      ),
      new Step(
          title: new Text('Step 2'),
          content: new Text('Do something for step 2'),
          isActive: true
      ),
      new Step(
          title: new Text('Step 3'),
          content: new Text('Do something for step 3'),
          isActive: true
      ),
    ];
  }

  void stepContinue() {
    setState(() {
      current++;
      if(current >= steps.length) current = steps.length - 1;
    });
  }

  void stepCancel(){
    setState(() {
      current--;
      if(current < 0) current = 0;
    });
  }

  void stepTap(int index) {
    setState(() {
      current = index;
    });
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
          child: new Stepper(
            steps: steps,
            type: StepperType.vertical,
            currentStep: current,
            onStepCancel: stepCancel,
            onStepContinue: stepContinue,
            onStepTapped: stepTap,
          ),
        ),
      ),
    );
  }
}