import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/app_screens/provider_flashcard.dart';

class EndCard extends StatefulWidget {
  const EndCard({Key? key}) : super(key: key);

  @override
  _EndCardState createState() => _EndCardState();
}

class _EndCardState extends State<EndCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountScore>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange,
          title: const Text("Finish FlashCard"),
          leading: GestureDetector(
            onTap: () {
              provider.ResetStatistic();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/MainScreen', (Route<dynamic> route) => false);
            },
            child: const Icon(
              Icons.home,
            ),
          ),
        ),
        body: Center(
            child: Container(
                margin: const EdgeInsets.only(
                    left: 50, right: 50, top: 60, bottom: 60),
                child: Column(children: [
                  Container(
                      margin: const EdgeInsets.only(
                          left: 50, right: 50, bottom: 40),
                      child: Image(image: AssetImage(provider.picture))),
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Center(
                          child: Text(provider.TopEndFlashcardtext,
                              style: const TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700)))),
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Center(
                          child: Text(provider.EndFlashcardtext,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w700))))
                ]))),
      );
    });
  }
}
