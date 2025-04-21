import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ExamProvider.dart';

class QuestionCard extends StatelessWidget {
  final int index;

  const QuestionCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExamProvider>(context);
    final question = provider.questions[index];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Question ${index + 1} (${question.marks} Marks)",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(question.question),
              SizedBox(height: 10),
              ...List.generate(question.options.length, (optIndex) {
                return RadioListTile<int>(
                  value: optIndex,
                  groupValue: provider.selectedOptions[index],
                  onChanged: (val) => provider.selectOption(index, val!),
                  title: Text(question.options[optIndex]),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
