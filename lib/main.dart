import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;
  int prevCount = -1;

  void increaseCount() {
    setState(() {
      prevCount = counter;
    });
    if(counter < 50)
      {
        setState(() {
          counter = counter + 1;
        });
      }
  }

  void decreaseCount() {
    setState(() {
      prevCount = counter;
    });
    if(counter > 0)
      {
        setState(() {
          counter = counter - 1;
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    print('prevCount ' + '$prevCount');
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(title: Text('Counter App'), backgroundColor: Colors.deepPurple, elevation: 0.0, centerTitle: true,),
      body: Container(
        child: Center(
          child: Card(elevation: 20.0, color: Colors.deepPurple, child: Padding( padding: EdgeInsets.all( counter > 0 ? 2.5 * counter : 25.0 ), child: Text( prevCount == counter ? 'Going Back!' : '$counter', style: TextStyle(fontSize: 30.0, color: Colors.white),))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter > prevCount || counter == 0 ? increaseCount() : decreaseCount();
        },
        child: counter >= prevCount || counter == 0 ? Icon(Icons.arrow_circle_up_outlined) : Icon(Icons.arrow_circle_down_outlined),
        backgroundColor: Colors.deepPurple,
      )
    );
  }
}
