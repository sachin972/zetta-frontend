import 'package:flutter/material.dart';
import '../Models/MultimediaItem.dart';

class MultimediaCard extends StatelessWidget {
  final MultimediaItem item;

  const MultimediaCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink[50],
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: item.type == MediaType.video
            ? _buildVideoCard()
            : _buildFileCard(),
      ),
    );
  }

  Widget _buildVideoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.thumbnailUrl ?? "https://via.placeholder.com/150",
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white70,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.play_arrow, size: 32),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                color: Colors.black54,
                child: Text(
                  "${item.duration} / ${item.size}",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(item.subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }

  Widget _buildFileCard() {
    IconData icon;
    String label;

    switch (item.type) {
      case MediaType.document:
        icon = Icons.picture_as_pdf;
        label = "PDF";
        break;
      case MediaType.link:
        icon = Icons.link;
        label = "Link";
        break;
      case MediaType.image:
        icon = Icons.image;
        label = "IMG";
        break;
      default:
        icon = Icons.archive;
        label = "ZIP";
    }

    return Row(
      children: [
        Container(
          width: 50,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.red),
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(item.subtitle, style: const TextStyle(fontSize: 12)),
              if (item.pages != null || item.size.isNotEmpty)
                Text("${item.pages ?? ''} ${item.size}", style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }
}
