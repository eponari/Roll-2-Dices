import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Double Dice'),
          backgroundColor: Colors.red,
        ),
        body: Center(child: DicePage()),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePage createState() => _DicePage();
}

class _DicePage extends State<DicePage> {
  var leftDice,rightDice;
  void changeDice(){
    setState(() {
      leftDice=1+Random().nextInt(6);
      rightDice=1+Random().nextInt(6);
    });
  }
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      changeDice();
    });
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    changeDice();
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: double.infinity,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    changeDice();
                  });
                },
                child:  Image.asset("images/dice$leftDice.png")
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    changeDice();
                  });
                },
                child: Image.asset("images/dice$rightDice.png")
              ),
            ),
          ),
        ],
      ),
    );
  }
}
