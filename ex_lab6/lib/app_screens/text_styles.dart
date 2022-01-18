import 'dart:ui';
import 'package:flutter/material.dart';

class MyName extends StatelessWidget {
  const MyName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.redAccent,
          height: 100.0,
          margin: const EdgeInsets.all(40),
          padding: const EdgeInsets.all(10),
          child: const Text(
            "ดลย์ หินตะ",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Prompt',
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
