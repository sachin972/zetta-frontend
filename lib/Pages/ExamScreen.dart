import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/QuestionCard.dart';
import '../Models/QuestionItem.dart';
import '../providers/ExamProvider.dart';
import 'ExamResults.dart';

class ExamScreen extends StatefulWidget {
  final String title;
  const ExamScreen({required this.title});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ExamProvider>(context, listen: false);
    provider.initialize([
      Question(
        question: 'What is Flutter?',
        options: ['SDK', 'IDE', 'OS', 'Editor'],
        answer: 0,
        marks: 2,
      ),
      Question(
        question: 'Who developed Flutter?',
        options: ['Google', 'Facebook', 'Apple', 'Microsoft'],
        answer: 0,
        marks: 2,
      ),
      Question(
        question: 'Dart is used for?',
        options: ['Frontend', 'Backend', 'Mobile', 'All of the above'],
        answer: 3,
        marks: 2,
      ),
    ]);
  }

  String formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExamProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Center(child: Text(formatTime(provider.timerSeconds))),
        )],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.questions.length,
              itemBuilder: (ctx, i) => QuestionCard(index: i),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                provider.stopTimer();
                final score = provider.calculateScore();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultScreen(score: score, total: provider.questions.length * 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
              child: Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}
