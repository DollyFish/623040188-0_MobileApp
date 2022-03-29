import 'package:ex_lab9/states/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TapChoiceBox extends StatefulWidget {
  final String name;
  final Color color;
  final bool answer;
  final int numpage;
  final Map<dynamic, dynamic> info;
  const TapChoiceBox(
      {Key? key,
      required this.name,
      required this.color,
      required this.answer,
      required this.numpage,
      required this.info})
      : super(key: key);

  @override
  _TapChoiceBoxState createState() => _TapChoiceBoxState();
}

class _TapChoiceBoxState extends State<TapChoiceBox> {
  bool _active = false;
  Color _activecolor = Colors.red;

  void _handleTop() {
    setState(() {
      _active = !_active;
    });
    if (widget.answer == true) {
      _activecolor = Colors.green;
    }
  }

  void _ShowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer<TotalScore>(builder: (context, provider, child) {
            return AlertDialog(
              title: const Text("Score!"),
              content: Text(provider.text_score),
              actions: <Widget>[
                ElevatedButton(onPressed: _checkpress, child: Text('Ok'))
              ],
            );
          });
        });
  }

  void _checkpress() {
    if (widget.numpage < widget.info.length) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PokemonQuiz(num: widget.numpage + 1, info: widget.info)));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const RestartScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TotalScore>(builder: (context, provider, child) {
      return GestureDetector(
          onTap: () {
            _handleTop();
            _ShowDialog(context);
            provider.checkTrue(widget.answer);
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
    });
  }
}

class RestartScreen extends StatelessWidget {
  const RestartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TotalScore>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your total score is ${provider.score}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.resetAllScore();
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text('Restart')),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PokemonQuiz extends StatefulWidget {
  const PokemonQuiz({Key? key, required this.num, required this.info})
      : super(key: key);

  final int num;
  final Map<dynamic, dynamic> info;

  @override
  _PokemonQuizState createState() => _PokemonQuizState();
}

class _PokemonQuizState extends State<PokemonQuiz> {
  late String question;
  late String imgurl;
  late String choice1;
  late Color color1;
  late bool answer1;
  late String choice2;
  late Color color2;
  late bool answer2;
  late String choice3;
  late Color color3;
  late bool answer3;
  late String choice4;
  late Color color4;
  late bool answer4;

  bool previous = true;
  Widget? nextPokemon;

  @override
  void initState() {
    super.initState();
    question = widget.info[widget.num]["question"];
    imgurl = widget.info[widget.num]["imgurl"];
    choice1 = widget.info[widget.num]["choice1"];
    color1 = widget.info[widget.num]["c1_color"];
    answer1 = widget.info[widget.num]["c1_answer"];
    choice2 = widget.info[widget.num]["choice2"];
    color2 = widget.info[widget.num]["c2_color"];
    answer2 = widget.info[widget.num]["c2_answer"];
    choice3 = widget.info[widget.num]["choice3"];
    color3 = widget.info[widget.num]["c3_color"];
    answer3 = widget.info[widget.num]["c3_answer"];
    choice4 = widget.info[widget.num]["choice4"];
    color4 = widget.info[widget.num]["c4_color"];
    answer4 = widget.info[widget.num]["c4_answer"];
    if (widget.num > 1 && widget.num <= widget.info.length) {
      previous = false;
    }

    if (widget.num < widget.info.length) {
      nextPokemon = PokemonQuiz(num: widget.num + 1, info: widget.info);
    } else {
      nextPokemon = const RestartScreen();
    }
  }

  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Consumer<TotalScore>(builder: (context, provider, child) {
      return Scaffold(
        appBar: screenW <= 600
            ? AppBar(
                title: Text("Question ${widget.num}"),
                backgroundColor: Colors.redAccent)
            : null,
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 30, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30.0, color: Colors.red),
                ),
                Expanded(
                  child: Image(
                    image: NetworkImage(imgurl),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: TapChoiceBox(
                        name: choice1,
                        color: color1,
                        answer: answer1,
                        numpage: widget.num,
                        info: widget.info,
                      ),
                    ),
                    Expanded(
                      child: TapChoiceBox(
                        name: choice2,
                        color: color2,
                        answer: answer2,
                        numpage: widget.num,
                        info: widget.info,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: TapChoiceBox(
                        name: choice3,
                        color: color3,
                        answer: answer3,
                        numpage: widget.num,
                        info: widget.info,
                      ),
                    ),
                    Expanded(
                      child: TapChoiceBox(
                        name: choice4,
                        color: color4,
                        answer: answer4,
                        numpage: widget.num,
                        info: widget.info,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IgnorePointer(
                          ignoring: previous,
                          child: Opacity(
                            opacity: previous ? 0 : 1,
                            child: SizedBox(
                              width: 90,
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Previous"),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          child: SizedBox(
                            width: 90,
                            child: ElevatedButton(
                              onPressed: () {
                                provider.resetAllScore();
                                Navigator.pushNamed(context, '/');
                              },
                              child: const Text("Home"),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          ignoring: nextPokemon == null,
                          child: Opacity(
                            opacity: nextPokemon == null ? 0 : 1,
                            child: SizedBox(
                              width: 90,
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            nextPokemon ?? Container())),
                                child: const Text("Next"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
