import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummitButton extends StatelessWidget {
  const SummitButton({Key? key}) : super(key: key);

  void alertMsg(BuildContext context) {
    var alertDialog = const AlertDialog(
      title: Text("Confirmation"),
      content: Text("Submitting information"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
          onPressed: () => {alertMsg(context)},
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            padding: const EdgeInsets.all(12),
            textStyle: const TextStyle(fontSize: 30),
          ),
          child: const Text(
            "Submit",
            style: TextStyle(fontSize: 23, color: Colors.white),
          )),
    );
  }
}
