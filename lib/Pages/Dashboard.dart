import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notices = [
      {
        'title': 'School is going for vacation in next month',
        'date': '02 March 2020'
      },
      {
        'title': 'Summer Book Fair at School Campus in June',
        'date': '02 March 2020'
      },
      {'title': 'School is going for vacation again', 'date': '02 March 2020'},
    ];

    final homework = [
      {
        'title': 'Learn Chapter 5 with one Essay',
        'subject': 'English',
        'date': 'Today',
        'done': false
      },
      {
        'title': 'Exercise Trigonometry 1st topic',
        'subject': 'Maths',
        'date': 'Today',
        'done': true
      },
      {
        'title': 'Hindi writing 3 pages',
        'subject': 'Hindi',
        'date': 'Yesterday',
        'done': false
      },
      {
        'title': 'Test for History first session',
        'subject': 'Social Science',
        'date': 'Yesterday',
        'done': false
      },
      {
        'title': 'Learn Atoms Physics',
        'subject': 'Science',
        'date': '16 March 2020',
        'done': true
      },
      {
        'title': 'English writing 3 pages',
        'subject': 'English',
        'date': '16 March 2020',
        'done': false
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              // Profile Header
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF5D36FB),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.grid_view, color: Colors.white),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yogita Shaje',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Class VII B',
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://i.pravatar.cc/150?img=5'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Notice Board
              Text(
                'Notice Board',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: notices.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = notices[index];
                    final colors = [
                      Colors.pink.shade100,
                      Colors.blue.shade100,
                      Colors.orange.shade100
                    ];
                    return Container(
                      width: 180,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors[index % colors.length],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              item['title']! as String,
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['date']!,
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Homework
              Text(
                'Homework',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...homework.map((item) {
                final isDone = item['done'] as bool;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDone
                        ? Colors.deepPurple.shade100.withOpacity(0.6)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isDone
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: isDone ? Colors.deepPurple : Colors.grey,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title']! as String,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${item['subject']} / ${item['date']}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
