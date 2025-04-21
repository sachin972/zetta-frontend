import 'dart:async';
import 'package:flutter/material.dart';
import '../Models/QuestionItem.dart';

class ExamProvider extends ChangeNotifier {
  List<Question> questions = [];
  List<int?> selectedOptions = [];
  int timerSeconds = 1800;
  Timer? _timer;

  void initialize(List<Question> qList) {
    questions = qList;
    selectedOptions = List.filled(qList.length, null);
    timerSeconds = 1800;
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerSeconds > 0) {
        timerSeconds--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void selectOption(int index, int value) {
    selectedOptions[index] = value;
    notifyListeners();
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedOptions[i] == questions[i].answer) {
        score += questions[i].marks;
      }
    }
    return score;
  }
}
