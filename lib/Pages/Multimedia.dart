import 'package:flutter/material.dart';
import '../Components/MultimediaCard.dart';
import '../Models/MultimediaItem.dart';

class MultimediaPage extends StatelessWidget {
  const MultimediaPage({super.key});

  static final List<MultimediaItem> allItems = [
    MultimediaItem(
      title: "Social Science Syllabus",
      subtitle: "Syllabus for 2020 batch",
      type: MediaType.document,
      pages: "12 pages",
      size: "360 KB",
    ),
    MultimediaItem(
      title: "Chapter-wise MCQs & Answers",
      subtitle: "Live Stream Capture",
      type: MediaType.video,
      thumbnailUrl: "https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg",
      duration: "25:00:00",
      size: "6 MB",
    ),
    MultimediaItem(
      title: "Improvement in Food Resources",
      subtitle: "Syllabus for 2020 batch",
      type: MediaType.document,
      size: "15 MB",
    ),
    MultimediaItem(
      title: "Exemplar Solutions Class 10",
      subtitle: "Syllabus for 2020 batch",
      type: MediaType.document,
      pages: "12 pages",
      size: "360 KB",
    ),
    MultimediaItem(
      title: "Preparation Tips",
      subtitle: "Syllabus for 2020 batch",
      type: MediaType.document,
      size: "15 MB",
    ),
  ];

  List<MultimediaItem> getFilteredItems(MediaType? type) {
    if (type == null) return allItems;
    return allItems.where((item) => item.type == type).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Multimedia"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "All"),
              Tab(text: "Video"),
              Tab(text: "Images"),
              Tab(text: "Documents"),
              Tab(text: "Links"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabContent(null),
            _buildTabContent(MediaType.video),
            _buildTabContent(MediaType.image),
            _buildTabContent(MediaType.document),
            _buildTabContent(MediaType.link),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(MediaType? type) {
    final items = getFilteredItems(type);
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => MultimediaCard(item: items[index]),
    );
  }
}
