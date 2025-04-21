enum MediaType { video, image, document, link }

class MultimediaItem {
  final String title;
  final String subtitle;
  final MediaType type;
  final String size;
  final String? pages;
  final String? thumbnailUrl;
  final String? duration;

  MultimediaItem({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.size,
    this.pages,
    this.thumbnailUrl,
    this.duration,
  });
}
