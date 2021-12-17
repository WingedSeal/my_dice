import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DicePage(),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  List<int> dicesNumber = [
    Random().nextInt(6) + 1,
    Random().nextInt(6) + 1,
    Random().nextInt(6) + 1
  ];

  void changeDiceFace(int dice) {
    setState(() {
      dicesNumber[dice] = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.yellow[700],
        appBar: AppBar(
          title: const Text('My Dice'),
          titleTextStyle: TextStyle(fontSize: 50, color: Colors.grey[800]),
          centerTitle: true,
          backgroundColor: Colors.yellow[600],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            'Roll All',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              dicesNumber = [
                Random().nextInt(6) + 1,
                Random().nextInt(6) + 1,
                Random().nextInt(6) + 1
              ];
            });
          },
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  child: Image.asset(
                    'images/dice${dicesNumber[0]}.png',
                  ),
                  onPressed: () {
                    changeDiceFace(0);
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset(
                    'images/dice${dicesNumber[1]}.png',
                  ),
                  onPressed: () {
                    changeDiceFace(1);
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset(
                    'images/dice${dicesNumber[2]}.png',
                  ),
                  onPressed: () {
                    changeDiceFace(2);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
