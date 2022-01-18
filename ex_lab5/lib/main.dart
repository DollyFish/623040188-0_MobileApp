import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class ItemCounter extends StatefulWidget {
  const ItemCounter({Key? key}) : super(key: key);

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GestureDetector(
        onTap: () {
          setState(
            () {
              counter++;
            },
          );
        },
        child: Text(
          '$counter',
          style: const TextStyle(
            fontSize: 25.0,
          ),
        ),
      )
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: const Text('Stateful Widgets Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              ItemCounter(),
            ],
          ),
        ),
      ),
    );
  }
}
