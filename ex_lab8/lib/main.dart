import 'package:flutter/material.dart';
import 'app_screen/long_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ehe",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 30;

  void _incrementCounter() {
    setState(() {
      _counter++;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Current number of problems is $_counter"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Exercise"),
      ),
      body: getListView(_counter),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
        tooltip: "Add One More Problem",
      ),
    );
  }
}
