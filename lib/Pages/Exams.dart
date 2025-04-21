import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ExamProvider.dart';
import 'ExamScreen.dart';

class ExamListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exams = [
      {'title': 'Science Basic Assessment', 'duration': 30},
      {'title': 'General Knowledge Level IV', 'duration': 30},
      {'title': 'Math Super 20 Exam', 'duration': 30},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Examination')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(exam['title']! as String),
              subtitle: Text('Duration: ${exam['duration']} min'),
              trailing: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider(
                      create: (_) => ExamProvider(),
                      child: ExamScreen(title: 'Math Test'),
                    ),
                  ),
                ),
                child: Text('Start Test'),
              ),
            ),
          );
        },
      ),
    );
  }
}
