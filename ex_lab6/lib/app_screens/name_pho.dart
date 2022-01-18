import 'package:flutter/material.dart';
import 'mypic.dart';
import 'summit_button.dart';

class Wordding extends StatelessWidget {
  final String letter;
  const Wordding(this.letter);

  @override
  Widget build(BuildContext context) {
    return Text(
      letter,
      textDirection: TextDirection.ltr,
      style: const TextStyle(
        decoration: TextDecoration.none,
        fontFamily: 'Prompt',
        fontSize: 23.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }
}

class NameWithPho extends StatelessWidget {
  const NameWithPho({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.redAccent,
          margin: const EdgeInsets.all(30),
          padding:
              const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 10),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Expanded(child: Wordding("Dol Hinta")),
                  Expanded(child: Wordding("623040188-0")),
                ],
              ),
              Row(
                children: const <Widget>[
                  Expanded(child: Wordding("Photo Credit:")),
                  Expanded(child: Wordding("DeadWish")),
                ],
              ),
              const MyPicAsset(),
              const SummitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
