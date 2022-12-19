import 'package:flutter/material.dart';
import 'package:scrambletext/scrambletext.dart';

void main() {
  runApp(const Scramble());
}

class Scramble extends StatelessWidget {
  const Scramble({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrable Text',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06000f),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            ScrambleText(
              texts: ["Scramble Text", "Awesome", "Text Plugin"],
              style: TextStyle(
                color: Color(0xffee3b6a),
                fontSize: 30,
              ),
              loop: true,
              words: "##*^(K:LO}}{{{",
              duration: Duration(seconds: 3),
              charDuraction: Duration(milliseconds: 400),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
