import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // TextEditingController firstController = TextEditingController();
  // TextEditingController secondController = TextEditingController();
  // // double result = 0; 

  var tController1 = TextEditingController();
  var tController2 = TextEditingController();
  var tController3 = TextEditingController();
  var result = "result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: titleWidget(),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            firstTF(),
            SizedBox(height: 20),
            secondTF(),
            SizedBox(height: 20),
            thirdTF(),
            SizedBox(height: 20),
            calculateButtonWidget(),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                color: Colors.green,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  firstTF() {
    return TextField(
      controller: tController1,
      decoration: InputDecoration(
        labelText: ("Enter Weight(Kg)"),
        // hintText: ("Enter Numbers Only!"),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 5.0),
            borderRadius: BorderRadius.circular(30)),
        // prefix: Icon(Icons.person),
      ),
    );
  }

  secondTF() {
    return TextField(
      controller: tController2,
      decoration: InputDecoration(
        labelText: ("Enter Height(Feet)"),
        // hintText: ("Enter Numbers Only!"),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 5.0),
            borderRadius: BorderRadius.circular(30)),
        // prefix: Icon(Icons.lock),
      ),
    );
  }

  thirdTF() {
    return TextField(
      controller: tController3,
      decoration: InputDecoration(
        labelText: ("Enter Height(Inches)"),
        // hintText: ("Enter Numbers Only!"),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 5.0),
            borderRadius: BorderRadius.circular(30)),
        // prefix: Icon(Icons.lock),
      ),
    );
  }

  calculateButtonWidget() {
    return ElevatedButton(
        onPressed: _calculateBMI, child: Text("Calculate BMI"));
  }

  _calculateBMI() {
    double weight = double.parse(tController1.text);
    double feet = double.parse(tController2.text);
    double inches = double.parse(tController3.text);
    double totalInches = (feet * 12) + inches;

    var bmi = (weight * 703) / (totalInches * totalInches);
    if (bmi < 18.5) {
      result = "You are under Weight! $bmi";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      result = "You are normal Weight :<() $bmi";
    } else if (bmi >= 25 && bmi <= 29.9) {
      result = "You are over Weight! $bmi";
    } else {
      result = "You are obesed! $bmi";
    }

    setState(() {
      result;
    });
  }

  Widget titleWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[Icon(Icons.add_box), Text("BMI Calculator")],
    );
  }
}
