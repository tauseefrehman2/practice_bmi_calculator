import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/leftbar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightConroller = TextEditingController();
  TextEditingController _weightConroller = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: accentColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  child: TextField(
                    controller: _heightConroller,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.8))),
                  ),
                ),
                Container(
                  width: 150,
                  child: TextField(
                    controller: _weightConroller,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.8))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double h = double.parse(_heightConroller.text);
                double w = double.parse(_weightConroller.text);
                setState(() {
                  _bmiResult = w / (h * h);
                  if (_bmiResult > 25.0) {
                    _textResult = "You are over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You are normal weight";
                  }else{
                    _textResult="You are under weight";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                    color: accentColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(
                  color: accentColor,
                  fontSize: 90,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: TextStyle(
                    color: accentColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 30),
            const LeftBar(barWidth: 20),
            const SizedBox(height: 30),
            const LeftBar(barWidth: 70),
            const SizedBox(height: 30),
            const LeftBar(barWidth: 50),
            const RightBar(barWidth: 50),
            const SizedBox(height: 40),
            const RightBar(barWidth: 50),
          ],
        ),
      ),
    );
  }
}
