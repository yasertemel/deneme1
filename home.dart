import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateHomeScreen();
  }
}

class StateHomeScreen extends State<HomeScreen> {
  int currentScreen = 1;
  int system;
  int gender;
  int age;
  int weightPart1;
  int weightPart2;
  int heightPart1;
  int heightPart2;
  int heightPart3;
  TextEditingController controllerAge = TextEditingController();
  TextEditingController controllerWeightPart1 = TextEditingController();
  TextEditingController controllerWeightPart2 = TextEditingController();
  TextEditingController controllerHeightPart1 = TextEditingController();
  TextEditingController controllerHeightPart2 = TextEditingController();
  TextEditingController controllerHeightPart3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator')
      ),
      body: _body()
    );
  }

  Widget _body() {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: _content()
    );
  }

  Widget _content() {
    if(currentScreen == 1) {
      return _systemWidget();
    } else if(currentScreen == 2) {
      return _genderWidget();
    } else if(currentScreen == 3){
      return _ageWidget();
    } else if(currentScreen == 4) {
      if (system == 1) {
        return _heightAndWeightWidgetForMetric();
      } else {
        return _heightAndWeightWidgetForImperial();
      }
    }
  }

  Widget _systemWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Metric"),
            onPressed: () {
              setState(() {
               currentScreen = 2;
               system = 1; 
              });
            },
          ),
          RaisedButton(
            child: Text("Imperial"),
            onPressed: () {
              setState(() {
                currentScreen = 2;
                system = 2;
              });
            },
          )
        ],
      )
    );
  }

  Widget _genderWidget() {
    return Container(
      child:  Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Male"),
            onPressed: () {
              setState(() {
               currentScreen = 3; 
               gender = 1;
              });
            },
          ),
          RaisedButton(
            child: Text("Female"),
            onPressed: () {
              setState(() {
                currentScreen = 3;
                gender = 2;
              });
            },
          )
        ],
      )
    );
  }

  Widget _ageWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your age"
            ),
            controller: controllerAge,
          ),
          RaisedButton(
            child: Text("Next"),
            onPressed: () {
              setState(() {
               currentScreen = 4;
               age = int.tryParse(controllerAge.text);
              });
            },
          )
        ],
      )
    );
  }

  Widget _heightAndWeightWidgetForMetric() {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your weight"
            ),
            controller: controllerWeightPart1,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your height"
            ),
            controller: controllerHeightPart1,
          ),
          RaisedButton(
            child: Text("Calculate"),
            onPressed: () {
              setState(() {
                weightPart1 = int.tryParse(controllerWeightPart1.text);
                heightPart1 = int.tryParse(controllerHeightPart1.text);
                print(system);
                print(gender);
                print(age);
                print(weightPart1);
                print(heightPart1);
              });
            },
          )
        ],
      )
    );
  }

  Widget _heightAndWeightWidgetForImperial() {
    return Container (
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex:1,
                child:
                TextField(
                decoration: InputDecoration(
                  hintText: "ft"
                ),
                controller: controllerHeightPart2,
              ),
              ),
              Container( width: 16.0),
              Expanded(
                flex:1,
                child: 
                TextField(
                decoration: InputDecoration(
                  hintText: "in"
                ),
                controller: controllerHeightPart3,
              )
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                decoration: InputDecoration(
                  hintText: "weigth"
                ),
                controller: controllerWeightPart2,
              ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Calculate"),
                onPressed: () {
                weightPart2 = int.tryParse(controllerWeightPart2.text);
                heightPart2 = int.tryParse(controllerHeightPart2.text);
                heightPart3 = int.tryParse(controllerHeightPart3.text);
                print(system);
                print(gender);
                print(age);
                print(weightPart2);
                print(heightPart2);
                print(heightPart3);
                },
              )
            ],
          )
        ],
      )
    );
  }
}