import 'package:flutter/material.dart';

class TotalScore extends ChangeNotifier {
  int score = 0;
  String text_score = "";

  void checkTrue(bool answer) {
    if (answer == true) {
      score += 1;
      text_score = "Your score is $score";
      notifyListeners();
    } else {
      text_score = "Sorry you miss it";
      notifyListeners();
    }
  }

  void resetAllScore() {
    score = 0;
    notifyListeners();
  }
}
