import 'package:flutter/material.dart';

const String texto = 'hola';
bool variable = false;
double fontSize = 20.0;
Color textColor = Colors.black;

void main() {
  runApp(Stateful());
}

class Stateful extends StatefulWidget {
  const Stateful({super.key});

  @override
  State<Stateful> createState() => _StatefulState();
}

class _StatefulState extends State<Stateful> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      if (variable == true)
        Text(
          texto,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  variable = true;
                });
              },
              child: Text('Show'),
            ),
          ),
          SizedBox(width:2),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  variable = false;
                });
              },
              child: Text('Del'),
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                fontSize = fontSize > 10.0 ? fontSize - 2.0 : fontSize;
              });
            },
            child: Text('-'),
          ),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              setState(() {
                fontSize += 2.0;
              });
            },
            child: Text('+'),
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                textColor = Colors.red;
              });
            },
            child: Text('Red'),
          ),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              setState(() {
                textColor = Colors.blue;
              });
            },
            child: Text('Blue'),
          ),
        ],
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 300.0, horizontal: 130.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}