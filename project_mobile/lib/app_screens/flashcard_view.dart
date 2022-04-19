import 'package:flutter/material.dart';

class FlashcardView extends StatefulWidget {
  final String text;
  final String bgcolor;
  const FlashcardView({Key? key, required this.text, required this.bgcolor})
      : super(key: key);

  @override
  _FlashcardViewState createState() => _FlashcardViewState();
}

class _FlashcardViewState extends State<FlashcardView> {
  @override
  Widget build(BuildContext context) {
    Color cardcolor = Colors.white;

    void setcolor(String bgcolor) {
      setState(() {
        if (bgcolor == "redAccent") {
          cardcolor = Colors.redAccent;
        } else if (bgcolor == "blueAccent") {
          cardcolor = Colors.blueAccent;
        } else if (bgcolor == "greenAccent") {
          cardcolor = Colors.greenAccent;
        } else if (bgcolor == "yellow") {
          cardcolor = Colors.yellow;
        } else {
          cardcolor = Colors.white;
        }
      });
    }

    setcolor(widget.bgcolor);

    return Card(
      elevation: 20,
      color: cardcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
      child:  Center(
            child:Text(widget.text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight:FontWeight.w700))),
    );
  }
}
