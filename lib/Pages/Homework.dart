import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/HomeworkTile.dart';
import '../Models/HomewrokItem.dart';

class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeworkData = {
      'Today': [
        HomeworkItem(
            "Learn Chapter 5 with one Essay", "English", false, "Today"),
        HomeworkItem("Exercise Trigonometry 1st topic", "Maths", true),
        HomeworkItem("Hindi writing 3 pages", "Hindi", true),
        HomeworkItem("Test for History first session", "Social Science", false),
      ],
      'Yesterday': [
        HomeworkItem(
            "Learn Chapter 5 with one Essay", "English", false, "Today"),
        HomeworkItem("Exercise Trigonometry 1st topic", "Maths", true),
      ],
      '16 March 2020': [
        HomeworkItem("Learn Chapter 5 with one Essay", "English", false),
        HomeworkItem("Exercise Trigonometry 1st topic", "Maths", true),
      ],
      '15 March 2020': [
        HomeworkItem("Learn Chapter 5 with one Essay", "English", false),
        HomeworkItem("Exercise Trigonometry 1st topic", "Maths", true),
      ],
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D36FB),
        elevation: 0,
        title: Text(
          'Homework',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: homeworkData.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  entry.key,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                ...entry.value.map((hw) => HomeworkTile(item: hw)).toList(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
