import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'app_screens/flashcard_screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import '/app_screens/provider_flashcard.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountScore(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  void OnClick() {
    setState(() {
      isDialOpen.value = !isDialOpen.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountScore>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.orange[800],
              title: const CircleAvatar(
                backgroundImage: AssetImage('images/RRR.png'),
              ) //lid/app_screes/RRR.png"),radius: 25,)
              ),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            openCloseDial: isDialOpen,
            backgroundColor: Colors.orange[800],
            overlayColor: Colors.grey,
            overlayOpacity: 0.5,
            spacing: 15,
            spaceBetweenChildren: 15,
            closeManually: true,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.add),
                  label: 'Add New Card',
                  onTap: () {
                    Navigator.pushNamed(context, '/AddNewCard');
                    OnClick();
                  }),
              SpeedDialChild(
                  child: Icon(Icons.edit),
                  label: 'Create New Deck',
                  onTap: () {
                    Navigator.pushNamed(context, '/EditCard');
                    OnClick();
                  }),
              SpeedDialChild(
                  child: Icon(Icons.delete),
                  label: 'Delete Deck',
                  onTap: () {
                    Navigator.pushNamed(context, '/DeletePage');
                    OnClick();
                  }),
            ],
          ),
          body: Column(
            children: [
              Container(
                  height: 40,
                  color: Colors.white70,
                  child: Row(children: [
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "File",
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                        margin: const EdgeInsets.only(left: 250, right: 10),
                        child: const Text("Download",
                            style: TextStyle(fontSize: 20)))
                  ])),
              const Divider(),
              SizedBox(
                height: 600,
                child: ListView.builder(
                    itemCount: provider.namecard.length,
                    itemBuilder: (context, index) {
                      return ListLanguage(
                        language: provider.namecard[index],
                        status: const Icon(Icons.check),
                        touch: false,
                        flashcards: provider.flashcard,
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CountScore>(builder: (context, provider, child) {
      provider.readFile();

      return Scaffold(
        backgroundColor: Colors.orange[800],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('images/Logo.png'),),
              Container(
                margin: const EdgeInsets.only(top: 0, bottom: 75),
                child: const Text("",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: OutlineButton(
                          onPressed: () {
                            print(provider.AllLanguagelist);
                            provider.UpdateDeck();
                            Navigator.pushNamed(context, '/MainScreen');
                          },
                          child: const Text('Start',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)))))
            ],
          ),
        ),
      );
    });
  }
}

class DeletePage extends StatefulWidget {
  DeletePage({Key? key, required this.dropdownvalue}) : super(key: key);
  late String dropdownvalue;

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
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
              Text("Delete Deck"),
            ],
          ),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 225),
                  child: const Text("Delete Deck",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700)),
                ),
                Container(
                    height: 40,
                    width: 300,
                    margin: const EdgeInsets.only(bottom: 225),
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
                    height: 50,
                    width: 300,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: OutlineButton(
                            onPressed: () {
                              provider.DeleteDeck(context, widget.dropdownvalue);
                            },
                            child: const Text('Delete',
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


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountScore>(builder: (context, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const StartPage(),
          '/MainScreen': (context) => MainScreen(),
          '/EditCard': (context) => const EditCard(),
          '/AddNewCard': (context) => AddNewCard(
                dropdownvalue: provider.namecard[0],
              ),
          '/AddNewCardForDeck': (context) => AddNewCardForDeck(),
          '/DeletePage': (context) => DeletePage(dropdownvalue: provider.namecard[0]),
        },
        title: "Basic list View Demo",
      );
    });
  }
}
