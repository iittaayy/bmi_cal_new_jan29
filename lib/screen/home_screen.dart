import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String screenID = 'login_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

   TextEditingController _weightController = TextEditingController();
   TextEditingController _heightController = TextEditingController();
  double _bmiResult = 0;
  String _resultText = 'Your Result will be shown here';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'BMI Calculator',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.white,

      body: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top:20.0,),
                      width: 130,
                      child: TextField(
                        controller: _heightController,
                        style:  const TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'Height',
                            hintStyle: TextStyle(
                              fontSize: 35.0,
                              color: Colors.black,
                            )
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top:20.0,),
                      width: 130,
                      child: TextField(
                        controller: _weightController,
                        style: const TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Weight',
                            hintStyle: TextStyle(
                              fontSize: 35.0,
                              color: Colors.black,
                            )
                        ),
                      ),
                    ),
                  ],

                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    double _h = double.parse(_heightController.text);
                    double _w = double.parse(_weightController.text);
                    setState(() {
                      _bmiResult = _w/(_h*_h);
                      if(_bmiResult >= 25){
                        _resultText = 'You are overweight';
                      } else if (_bmiResult <= 10){
                        _resultText = 'Looking good';
                      } else {
                        _resultText = 'fine';
                      }
                    });
                  }, child: Text('Calcualte'),),
                const SizedBox(
                  height: 30,
                ),
                Text(_bmiResult.toStringAsFixed(2), style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    _resultText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                  ),),
                ),
              ],
            ),
      ),

    );
  }
}