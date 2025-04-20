import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {'label': 'Dashboard', 'icon': Icons.home, 'route': '/dashboard'},
      {'label': 'Messages', 'icon': Icons.message, 'route': '/messages'},
      {
        'label': 'Assignments',
        'icon': Icons.assignment_turned_in,
        'route': '/assignments'
      },
      {'label': 'Events', 'icon': Icons.event, 'route': '/events'},
      {'label': 'Library', 'icon': Icons.library_books, 'route': '/library'},
      {'label': 'Homework', 'icon': Icons.menu_book, 'route': '/homework'},
      {
        'label': 'Attendance',
        'icon': Icons.event_available,
        'route': '/attendance'
      },
      {
        'label': 'Fee Details',
        'icon': Icons.account_balance_wallet,
        'route': '/feeDetails'
      },
      {
        'label': 'Examination',
        'icon': Icons.assignment,
        'route': '/examination'
      },
      {'label': 'Report Cards', 'icon': Icons.receipt, 'route': '/reportCards'},
      {'label': 'Calendar', 'icon': Icons.calendar_month, 'route': '/calendar'},
      {
        'label': 'Notice Board',
        'icon': Icons.campaign,
        'route': '/noticeBoard'
      },
      {'label': 'Multimedia', 'icon': Icons.perm_media, 'route': '/multimedia'},
      {
        'label': 'Academic Year',
        'icon': Icons.school,
        'route': '/academicYear'
      },
      {'label': 'Profile', 'icon': Icons.person, 'route': '/profile'},
    ];

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      decoration: const BoxDecoration(
        color: Color(0xFF5D36FB),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=5'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yogita Shaje',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Class VII B',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Grid Menu
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: menuItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return TextButton(
                  onPressed: () {
                    // Handle navigation
                    Navigator.pushNamed(context, item['route'] as String);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 28,
                        child: Icon(item['icon'] as IconData,
                            color: Color(0xFF5D36FB), size: 28),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['label']! as String,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Logout
          Center(
            child: TextButton(
              onPressed: () {
                // Handle logout
                Navigator.pop(context);
              },
              child: Text(
                'Logout',
                style: GoogleFonts.poppins(
                  color: Colors.redAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
