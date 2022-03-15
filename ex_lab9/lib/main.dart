import 'package:flutter/material.dart';
import 'widgets/pokemon_info.dart';
import 'widgets/pokemon_quiz.dart';

void main() {
  runApp(const MyApp());
}

class ChoiceBox extends StatelessWidget {
  final String name;
  final Color color;
  const ChoiceBox(this.name, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.all(10.0),
      color: color,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 6),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

class TapChoiceBox extends StatefulWidget {
  final String name;
  final Color color;
  final bool answer;
  const TapChoiceBox(
      {Key? key, required this.name, required this.color, required this.answer})
      : super(key: key);

  @override
  _TapChoiceBoxState createState() => _TapChoiceBoxState();
}

class _TapChoiceBoxState extends State<TapChoiceBox> {
  bool _active = false;
  Color _activecolor = Colors.red;
  String _activetext = "Your score is 0";

  void _handleTop() {
    setState(() {
      _active = !_active;
    });
    if (widget.answer == true) {
      _activecolor = Colors.green;
      _activetext = "Your score is 1";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _handleTop();
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text(_activetext),
          //   duration: const Duration(seconds: 1),
          // ));
        },
        child: Container(
          padding: const EdgeInsets.all(3.0),
          margin: const EdgeInsets.all(10.0),
          color: _active ? _activecolor : widget.color,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 6),
            child: Text(
              widget.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout Flutter Exercise by Dol Hinta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PokemonInfo(),
    );
  }
}

class Homee extends StatelessWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: screenW <= 600
          ? AppBar(
              title: const Text("MobileApp"), backgroundColor: Colors.redAccent)
          : null,
      body: _Display(),
    );
  }
}

Widget _Display() {
  return Center(
    child: Container(
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text(
            "Who’s that Pokémon?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, color: Colors.red),
          ),
          const Expanded(
            child: Image(
              image: NetworkImage(
                  "https://cdn.vox-cdn.com/thumbor/e6Xz2K9_IRripMxMt4LutXtnrFU=/0x0:1920x1080/920x613/filters:focal(271x342:577x648):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/57794409/who_pokemon.0.jpg"),
            ),
          ),
          _RowUniversity(),
        ],
      ),
    ),
  );
}

Widget _RowUniversity() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          Expanded(
            // child: ChoiceBox('Pichu', Colors.blueAccent),
            child: TapChoiceBox(
              name: 'Pichu',
              color: Colors.blueAccent,
              answer: false,
            ),
          ),
          Expanded(
            // child: ChoiceBox('Pikapika', Colors.purpleAccent),
            child: TapChoiceBox(
              name: 'Pikapika',
              color: Colors.purpleAccent,
              answer: false,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          Expanded(
            // child: ChoiceBox('Pikachu', Colors.yellowAccent),
            child: TapChoiceBox(
              name: 'Pikachu',
              color: Colors.yellowAccent,
              answer: true,
            ),
          ),
          Expanded(
            // child: ChoiceBox('Pigachu', Colors.greenAccent),
            child: TapChoiceBox(
              name: 'Pigachu',
              color: Colors.greenAccent,
              answer: false,
            ),
          ),
        ],
      ),
    ],
  );
}
