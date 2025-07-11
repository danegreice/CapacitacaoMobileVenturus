import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _randomNumber = 0;
  var _text = '???';
  var _alert = '';
  final List<int> _randomNumberList = [];

  void _generateRandom() {
    setState(() {
      _randomNumber = Random().nextInt(10) + 1;
      _text = _randomNumber.toString();
      if (_randomNumberList.contains(_randomNumber)) {
        _alert = 'Este número ja foi sorteado!';
      } else {
        _alert = '';
        _randomNumberList.add(_randomNumber);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Número da sorte',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(148, 133, 22, 213),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 100),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Hoje é sue dia de sorte! Clique no botão abaixo e confira!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  _text,
                  style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
                ),
                Text(
                  _alert,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _generateRandom();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff8716d5),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('SORTE!', style: TextStyle(color: Colors.white)),
                ),
                Text(
                  'Números já sorteados: \n${_randomNumberList.toString()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff8716d5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
