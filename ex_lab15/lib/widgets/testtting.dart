import 'package:flutter/material.dart';

class Restartt extends StatefulWidget {
  const Restartt({Key? key}) : super(key: key);

  @override
  _RestarttState createState() => _RestarttState();
}

class _RestarttState extends State<Restartt> {
  bool ignore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: IgnorePointer(
                ignoring: ignore,
                child: Opacity(
                    opacity: ignore ? 0 : 1,
                    child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/'),
                        child: Text('Restart'))))));
  }
}
