import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/HomewrokItem.dart';

class HomeworkTile extends StatelessWidget {
  final HomeworkItem item;

  const HomeworkTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final checkColor =
        item.completed ? const Color(0xFF5D36FB) : Colors.transparent;
    final borderColor =
        item.completed ? const Color(0xFF5D36FB) : Colors.grey.shade400;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1EF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Circle check icon
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: checkColor,
              border: Border.all(color: borderColor, width: 2),
              shape: BoxShape.circle,
            ),
            child: item.completed
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 14),
          // Homework Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.poppins(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.due != null
                      ? "${item.subject} / ${item.due}"
                      : item.subject,
                  style: GoogleFonts.poppins(
                    fontSize: 12.5,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
