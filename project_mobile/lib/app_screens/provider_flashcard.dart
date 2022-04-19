import 'package:flutter/material.dart';
import 'flashcard.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class CountScore extends ChangeNotifier {
  Map<dynamic, dynamic> AllLanguagelist = {};
  Map<dynamic, dynamic> AllLanguagelist2 = {
    "English": [
      ["Agriculture", "วิชาการเกษตร", "white"],
      ["Archaeology", "วิชาโบราณคดี", "white"],
      ["Arts", "วิชาศิลปะ", "white"],
      ["Biology", "วิชาชีววิทยา", "white"],
      ["Business", "วิชาธุรกิจ", "white"],
      ["Chemistry", "วิชาเคมี", "white"],
      ["Geography", "วิชาภูมิศาสตร์", "white"],
      ["Performing", "การดำเนินการ", "white"],
      ["Physics", "วิชาฟิสิกส์", "white"],
      ["Politics", "วิชาการเมือง", "white"]
    ],
    "Japanese": [
      ["精神", "จิตวิญญาณ", "white"],
      ["犬神", "เทพเจ้าสุนัข", "white"],
      ["狐", "จิ้งจอก", "white"],
      ["運動", "ออกกำลังกาย", "white"],
      ["運動", "อุณหภูมิ", "white"],
      ["糖尿病", "โรคเบาหวาน", "white"],
      ["血液検査", "ตรวจเลือด", "white"],
      ["好中球", "เม็ดเลือดขาวชนิดนิวโทรฟิล", "white"],
      ["工学", "วิศวกรรมศาสตร์", "white"],
      ["建物", "สิ่งก่อสร้าง", "white"]
    ],
    "Thai": [
      ["นวลลออ", "สาวที่งามผุดผ่อง", "white"],
      ["เยาวมาลย์", "หญิงสาวสวย", "white"],
      ["จอมขวัญ", "หญิงผู้เป็นมิ่งขวัญ", "white"],
      ["สมร", "นางงามผู้เป็นที่รัก", "white"],
      ["อร", "หญิงงาม", "white"],
      ["โฉมยง", "งามสง่า", "white"],
      ["แก้วกานดา", "หญิงที่มีค่าดั่งแก้ว", "white"],
      ["บังอร", "น่ารัก", "white"],
      ["นงนุช", "สาวผู้มีอายุน้อยกว่า", "white"],
      ["ศรีสมร", "นางงามซึ่งเป็นที่รัก", "white"]
    ]
  };

  List<Flashcard> flashcard = [];

  List<String> namecard = [];

  String FrontCardDeck = "";
  String BackCardDeck = "";

  String FrontCard = "";
  String BackCard = "";

  String NameDeck = "";
  int MaxCard = 0;

  int Again = 0;
  int Hard = 0;
  int Good = 0;
  int Easy = 0;
  String GetLevel = "";

  String CurrentDeck = "";
  var EndListCard = [];

  String EndFlashcardtext = "";

  bool checkFile = true;
  int LenthDeck = 0;

  void UpdateDeck() {
    namecard = [];
    AllLanguagelist.forEach((key, value) {
      if (namecard.contains(key)) {
      } else {
        namecard.add(key);
      }
    });
  }

  void DeleteDeck(BuildContext context, deck) {
    int numKey = 0;
    AllLanguagelist.keys.forEach((element) {
      numKey += 1;
    });
    if (numKey == 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Warning"),
              content: const Text("You cannot delete deck more."),
              actions: <Widget>[
                ElevatedButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Warning"),
              content: const Text(
                  "This deck will deleted and Are you sure about that?"),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        child: const Text("OK"),
                        onPressed: () {
                          AllLanguagelist.remove(deck);
                          UpdateDeck();
                          saveFile();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/MainScreen', (Route<dynamic> route) => false);
                        }),
                    ElevatedButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ],
            );
          });
    }
  }

  void GetCardData(newdatalist) {
    for (var datacard in newdatalist) {
      EndListCard.add([datacard.question, datacard.answer, datacard.boxcolor]);
    }

    AllLanguagelist[CurrentDeck] = EndListCard;
    LenthDeck = EndListCard.length;

    CurrentDeck = "";
    EndListCard = [];
  }

  void ResetStatistic() {
    Hard = 0;
    Good = 0;
    Easy = 0;
    Again = 0;
    print("reset");
  }

  void Statistic() {
    if (GetLevel == "Hard") {
      Hard += 1;
      print("Click hard: $Hard");
    } else if (GetLevel == 'Good') {
      Good += 1;
      print("Click good: $Good");
    } else {
      Easy += 1;
      print("Click easy: $Easy");
    }
    GetLevel = "";
  }

  void UpdateNewDeckCard(BuildContext context, deck) {
    MaxCard -= 1;
    if (FrontCardDeck == "" || BackCardDeck == "") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Please fill Word in Cards"),
              actions: <Widget>[
                ElevatedButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    } else {
      var lst_word = AllLanguagelist[NameDeck];
      lst_word.add([FrontCardDeck, BackCardDeck, "white"]);
      AllLanguagelist[NameDeck] = lst_word;
      FrontCardDeck = "";
      BackCardDeck = "";

      if (MaxCard > 0) {
        Navigator.pushNamed(context, '/AddNewCardForDeck');
      } else {
        MaxCard = 0;
        NameDeck = "";
        saveFile();
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/MainScreen', (Route<dynamic> route) => false);
      }
    }
  }

  void NewDeckBackHome(BuildContext context, deck) {
    if (AllLanguagelist[deck].length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Please add some card"),
              actions: <Widget>[
                ElevatedButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    } else {
      FrontCardDeck = "";
      BackCardDeck = "";
      NameDeck = "";
      MaxCard = 0;
      saveFile();
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/MainScreen', (Route<dynamic> route) => false);
    }
  }

  void CreateNewDeck(BuildContext context) {
    if (NameDeck == "" ||
        MaxCard <= 0 ||
        AllLanguagelist.containsKey(NameDeck)) {
      String err_text = "Please fill Word in Cards";
      if (MaxCard <= 0) {
        err_text = "Please fill more than 0";
      }
      if (AllLanguagelist.containsKey(NameDeck)) {
        err_text = "Already have this deck";
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(err_text),
              actions: <Widget>[
                ElevatedButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    } else {
      AllLanguagelist[NameDeck] = [];

      print("Success");
      UpdateDeck();
      Navigator.pushNamed(context, '/AddNewCardForDeck');
    }
  }

  void UpdateCard(BuildContext context, deck) {
    if (FrontCard == "" || BackCard == "") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Please fill Word in Cards"),
              actions: <Widget>[
                ElevatedButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    } else {
      var lst_word = AllLanguagelist[deck];
      lst_word.add([FrontCard, BackCard, "white"]);
      AllLanguagelist[deck] = lst_word;
      FrontCard = "";
      BackCard = "";
      print("success");
      saveFile();
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/MainScreen', (Route<dynamic> route) => false);
    }
  }

  void GetInCard(name) {
    CurrentDeck = name;
    AllLanguagelist.forEach((key, value) {
      if (key == CurrentDeck) {
        for (var card in value) {
          flashcard.add(Flashcard(card[0], card[1], card[2]));
        }
      }
    });
  }

  void resetList() {
    flashcard.clear();
    print("clear");
  }

  String picture = "";
  String TopEndFlashcardtext = "";
  void EndFlashCard() {
    if ((Hard / LenthDeck) * 100 > 60) {
      picture = "images/hard.png";
      TopEndFlashcardtext = "Don't give up";
      EndFlashcardtext = "You should try more";
    } else if ((Good / LenthDeck) * 100 > 60) {
      picture = "images/good.png";
      TopEndFlashcardtext = "Nice One";
      EndFlashcardtext = "Almost done!";
    } else if ((Easy / LenthDeck) * 100 > 60) {
      picture = "images/easy.png";
      TopEndFlashcardtext = "Congratulations";
      EndFlashcardtext = "You did great!!!";
    } else {
      picture = "images/nicetry.png";
      TopEndFlashcardtext = "Still Good";
      EndFlashcardtext = "Don't give up";
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/AppFlashCard.txt');
  }

  Future<int> readFile() async {
    try {
      final file = await _localFile;

      // Read the file
      final response = await file.readAsString();
      Map<dynamic, dynamic> valueMap = json.decode(response);
      AllLanguagelist = valueMap;
      return 1;
    } catch (e) {
      writeFile().then((value) => readFile());
      return 0;
    }
  }

  Future<File> writeFile() async {
    final file = await _localFile;
    String text_in = json.encode(AllLanguagelist2);
    return file.writeAsString(text_in);
  }

  Future<File> saveFile() async {
    final file = await _localFile;
    String text_in = json.encode(AllLanguagelist);
    return file.writeAsString(text_in);
  }
}
