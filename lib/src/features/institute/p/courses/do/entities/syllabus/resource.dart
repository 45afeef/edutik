class Resource {
  final String id;
  final ResourceType type; // e.g., "Video", "PDF", "Link"
  final String title;
  final Uri url;

  Resource({
    required this.id,
    required this.type,
    required this.title,
    required this.url,
  });
}

enum ResourceType { video, pdf, link, plainText, richText }
