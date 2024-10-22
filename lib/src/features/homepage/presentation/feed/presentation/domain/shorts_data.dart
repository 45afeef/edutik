enum VideoSource { youTube, instagram, facebook, network }

class ShortsData {
  final String creatorProfile;
  final String creatorName;
  final String description;
  final String videoUrl;
  final VideoSource videoSource;
  final String title;
  final int likes;
  final int views;

  ShortsData({
    required this.creatorProfile,
    required this.creatorName,
    required this.description,
    required this.videoUrl,
    required this.videoSource,
    required this.title,
    required this.likes,
    required this.views,
  });
}
