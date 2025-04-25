import 'package:flutter/material.dart';

import '../Components/NoticeBoardCard.dart';
import '../Components/NoticeBoardHeader.dart';
import '../Models/NoticeBoardItem.dart';


class NoticeBoardScreen extends StatelessWidget {
  const NoticeBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NoticeItem> notices = [
      NoticeItem(
        title: "School is going for vacation in next month",
        date: "02 March 2020",
        image: "assets/images/kids1.png",
        backgroundColor: const Color(0xFFC3F6CF),
      ),
      NoticeItem(
        title: "Summer Book Fair at School Campus in June",
        date: "02 March 2020",
        image: "assets/images/bookfair.png",
        backgroundColor: const Color(0xFFC7F1FD),
      ),
      NoticeItem(
        title: "School is going for vacation in next month",
        date: "02 March 2020",
        image: "assets/images/kids2.png",
        backgroundColor: const Color(0xFFFFD7D7),
      ),
      NoticeItem(
        title: "School is going for vacation in next month",
        date: "02 March 2020",
        image: "assets/images/kids3.png",
        backgroundColor: const Color(0xFFC3F6CF),
      ),
      NoticeItem(
        title: "Summer Book Fair at School Campus in June",
        date: "02 March 2020",
        image: "assets/images/bookfair2.png",
        backgroundColor: const Color(0xFFC7F1FD),
      ),
      NoticeItem(
        title: "School is going for vacation in next month",
        date: "02 March 2020",
        image: "assets/images/kids4.png",
        backgroundColor: const Color(0xFFFFD7D7),
      ),
      NoticeItem(
        title: "School is going for vacation in next month",
        date: "02 March 2020",
        image: "assets/images/kids5.png",
        backgroundColor: const Color(0xFFC3F6CF),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const NoticeBoardHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: notices.length,
                padding: const EdgeInsets.only(top: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return NoticeCard(notice: notices[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}





