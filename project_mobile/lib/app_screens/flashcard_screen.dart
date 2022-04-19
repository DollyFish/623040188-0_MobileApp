import 'dart:ui';
import 'package:flutter/material.dart';
import 'flashcard.dart';
import 'flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'end_flashcard.dart';
import 'package:provider/provider.dart';
import '/app_screens/provider_flashcard.dart';

class AddNewCardForDeck extends StatefulWidget {
  const AddNewCardForDeck({
    Key? key,
  }) : super(key: key);

  @override
  _AddNewCardForDeckState createState() => _AddNewCardForDeckState();
}

class _AddNewCardForDeckState extends State<AddNewCardForDeck> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountScore>(builder: (context, provider, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.orange[800],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:
              Colors.orange, //lid/app_screes/RRR.png"),radius: 25,)
          title: Row(
            children: const [
              Text("Add New Card"),
            ],
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: const Text("New Card",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
                height: 350,
                width: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: const EdgeInsets.only(bottom: 125),
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 300,
                          child: TextFormField(
                            onChanged: (value) {
                              provider.FrontCardDeck = value;
                            },
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Front Card',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 300,
                          child: TextFormField(
                            onChanged: (value) {
                              provider.BackCardDeck = value;
                            },
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Back Card',
                            ),
                          ),
                        )
                      ]),
                )),
            SizedBox(
                height: 50,
                width: 300,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: OutlineButton(
                        onPressed: () {
                          provider.UpdateNewDeckCard(
                              context, provider.NameDeck);
                        },
                        child: const Text('Add',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700))))),
            SizedBox(
                height: 50,
                width: 300,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: OutlineButton(
                        onPressed: () {
                          provider.NewDeckBackHome(context, provider.NameDeck);
                        },
                        child: const Text('Back Home',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)))))
          ],
        )),
      );
    });
  }
}

//-------------------------------------------------------------------------------------------------------------------
class AddNewCard extends StatefulWidget {
  AddNewCard({Key? key, required this.dropdownvalue}) : super(key: key);
  late String dropdownvalue;

  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountScore>(builder: (context, provider, child) {
      var items = provider.namecard;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.orange[800],
        appBar: AppBar(
          backgroundColor:
              Colors.orange, //lid/app_screes/RRR.png"),radius: 25,)
          title: Row(
            children: const [
              Text("Add New Card"),
            ],
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: const Text("New Card",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700)),
            ),
            Container(
                height: 40,
                width: 300,
                margin: const EdgeInsets.only(bottom: 55),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                    child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    focusColor: Colors.black,
                    dropdownColor: Colors.white,
                    value: widget.dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.dropdownvalue = newValue!;
                      });
                    },
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                  ),
                ))),
            SizedBox(
                height: 350,
                width: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: const EdgeInsets.only(bottom: 125),
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 300,
                          child: TextFormField(
                            onChanged: (value) {
                              provider.FrontCard = value;
                            },
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Front Card',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 300,
                          child: TextFormField(
                            onChanged: (value) {
                              provider.BackCard = value;
                            },
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Back Card',
                            ),
                          ),
                        )
                      ]),
                )),
            SizedBox(
                height: 50,
                width: 300,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: OutlineButton(
                        onPressed: () {
                          provider.UpdateCard(context, widget.dropdownvalue);
                        },
                        child: const Text('Add',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)))))
          ],
        )),
      );
    });
  }
}

//---------------------------------------------------------------------------------------

class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  _EditCardState createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountScore>(builder: (context, provider, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.orange[800],
        appBar: AppBar(
          title: const Text("Add New Deck"),
          backgroundColor: Colors.orange,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 55),
              child: const Text("New Deck",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700)),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 75),
                height: 350,
                width: 350,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 300,
                        child: TextFormField(
                          onChanged: (value) {
                            provider.NameDeck = value;
                          },
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.white),
                              border: UnderlineInputBorder(),
                              labelText: 'Name Deck'),
                        ),
                      ),
                      SizedBox(
                          height: 100,
                          width: 300,
                          child: TextField(
                            onChanged: (value) {
                              provider.MaxCard = int.parse(value);
                            },
                            autocorrect: true,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.white),
                              border: UnderlineInputBorder(),
                              labelText: 'Maximum Cards',
                            ),
                          ))
                    ])),
            SizedBox(
                height: 50,
                width: 300,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: OutlineButton(
                        onPressed: () {
                          provider.CreateNewDeck(context);
                        },
                        child: const Text('Create New Deck',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)))))
          ],
        )),
      );
    });
  }
}

//---------------------------------------------------------------------------------------

class ListLanguage extends StatefulWidget {
  ListLanguage(
      {Key? key,
      required this.language,
      required this.status,
      required this.touch,
      required this.flashcards})
      : super(key: key);
  final String language;
  final Icon status;
  final bool touch;

  final List flashcards;

  @override
  _ListLanguageState createState() => _ListLanguageState();
}

class _ListLanguageState extends State<ListLanguage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountScore>(builder: (context, provider, child) {
      return IgnorePointer(
          ignoring: widget.touch,
          child: ListTile(
              title: Text(widget.language),
              leading: const Icon(Icons.auto_stories),
              trailing: widget.status,
              onTap: () {
                provider.resetList();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CardApp(
                          flashcardslist: widget.flashcards,
                          nameCard: widget.language,
                        )));
                provider.GetInCard(widget.language);
              }));
    });
  }
}

//---------------------------------------------------------------------------------------

class CardApp extends StatefulWidget {
  CardApp({Key? key, required this.flashcardslist, required this.nameCard})
      : super(key: key);
  final String nameCard;
  final List flashcardslist;

  @override
  State<StatefulWidget> createState() => _CardAppState();
}

class _CardAppState extends State<CardApp> {
  bool _active = false;
  bool _nextVisible = true;
  bool _levelVisible = true;
  int _currentIndex = 0;
  bool _againcheck = false;
  final List<Flashcard> _flashcards2 = [];
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  String boxxcolor = 'white';

  @override
  Widget build(BuildContext context) {
    boxxcolor = widget.flashcardslist[_currentIndex].boxcolor;
    int _numcard = widget.flashcardslist.length;

    return Consumer<CountScore>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[800],
          title: Text("${widget.nameCard} language"),
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              provider.ResetStatistic();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/MainScreen', (Route<dynamic> route) => false);
            },
            child: const BackButton(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.all(20),
                  child: Text("Remaining Card: ${_numcard}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700))),
              SizedBox(
                width: 300,
                height: 200,
                child: FlipCard(
                  key: cardKey,
                  onFlipDone: (status) {
                    _active = status;
                  },
                  front: GestureDetector(
                    onTap: () {
                      _showlevel();
                      cardKey.currentState!.toggleCard();
                    },
                    child: FlashcardView(
                      text: widget.flashcardslist[_currentIndex].question,
                      bgcolor: boxxcolor,
                    ),
                  ),
                  back: GestureDetector(
                    onTap: () {
                      cardKey.currentState!.toggleCard();
                    },
                    child: FlashcardView(
                      text: widget.flashcardslist[_currentIndex].answer,
                      bgcolor: boxxcolor,
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: _levelVisible,
                child: Opacity(
                  opacity: _levelVisible ? 0 : 1,
                  child: Container(
                      margin: const EdgeInsets.only(top: 59),
                      child: Column(
                        children: [
                          Center(
                              child: Row(children: [
                            Container(
                                height: 200,
                                width: 131,
                                color: Colors.redAccent,
                                child: OutlineButton(
                                    onPressed: () {
                                      _setcolor('redAccent');
                                      provider.GetLevel = "Hard";
                                      _againcheck = false;
                                    },
                                    child: const Text('Hard',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)))),
                            Container(
                                height: 200,
                                width: 130.5,
                                color: Colors.blueAccent,
                                child: OutlineButton(
                                    onPressed: () {
                                      provider.GetLevel = "Good";
                                      _setcolor('blueAccent');
                                      _againcheck = false;
                                    },
                                    child: const Text('Good',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)))),
                            Container(
                                height: 200,
                                width: 131,
                                color: Colors.greenAccent,
                                child: OutlineButton(
                                    onPressed: () {
                                      provider.GetLevel = "Easy";
                                      _setcolor('greenAccent');
                                      _againcheck = false;
                                    },
                                    child: const Text('Easy',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)))),
                          ])),
                          Center(
                            child: Container(
                                height: 70,
                                width: 392.5,
                                color: Colors.yellow,
                                child: OutlineButton(
                                    onPressed: () {
                                      _setcolor('yellow');
                                      _againcheck = true;
                                      _carflipcheck();
                                      provider.Again += 1;
                                    },
                                    color: Colors.amber,
                                    child: const Text('Again',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IgnorePointer(
                                ignoring: _nextVisible,
                                child: Opacity(
                                    opacity: _nextVisible ? 0 : 1,
                                    child: Container(
                                        height: 70,
                                        width: 392.5,
                                        color: Colors.orange[800],
                                        child: OutlineButton(
                                            onPressed: () {
                                              provider.Statistic();
                                              _carflipcheck();
                                            },
                                            child: const Text('Next',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700))))),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  void _setcolor(String ccolor) {
    setState(() {
      widget.flashcardslist[_currentIndex] = Flashcard(
          widget.flashcardslist[_currentIndex].question,
          widget.flashcardslist[_currentIndex].answer,
          ccolor);
      _shownext();
    });
  }

  void _shownext() {
    if (_nextVisible == true) {
      setState(() {
        _nextVisible = !_nextVisible;
      });
    }
  }

  void removeCard() {
    setState(() {
      if (_againcheck == false) {
        _flashcards2.add(widget.flashcardslist[_currentIndex]);

        if (widget.flashcardslist.length == 1) {
          widget.flashcardslist.addAll(_flashcards2);
          widget.flashcardslist.remove(widget.flashcardslist[0]);
          Provider.of<CountScore>(context, listen: false)
              .GetCardData(widget.flashcardslist);
          Provider.of<CountScore>(context, listen: false).EndFlashCard();

          Provider.of<CountScore>(context, listen: false).saveFile();

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EndCard()));
        } else {
          widget.flashcardslist.remove(widget.flashcardslist[_currentIndex]);
          if (_currentIndex == widget.flashcardslist.length) {
            _currentIndex = 0;
          }
        }
      } else {
        _currentIndex = (_currentIndex + 1 < widget.flashcardslist.length)
            ? _currentIndex + 1
            : 0;
        _againcheck = false;
      }

      _hidenext();
      _hidelevel();
    });
  }

  void _hidenext() {
    if (_nextVisible == false) {
      setState(() {
        _nextVisible = !_nextVisible;
      });
    }
  }

  void _showlevel() {
    if (_levelVisible == true) {
      setState(() {
        _levelVisible = !_levelVisible;
      });
    }
  }

  void _hidelevel() {
    if (_levelVisible == false) {
      setState(() {
        _levelVisible = !_levelVisible;
      });
    }
  }

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1 < widget.flashcardslist.length)
          ? _currentIndex + 1
          : 0;
      _hidenext();
      _hidelevel();
    });
  }

  void _carflipcheck() {
    if (_active == true) {
      setState(() {
        cardKey.currentState!.toggleCard();
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        removeCard();
      });
    } else {
      removeCard();
    }
  }
}
