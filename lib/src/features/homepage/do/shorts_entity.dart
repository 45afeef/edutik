enum VideoSource { youTube, instagram, facebook, network }

class ShortsEntity {
  final String creatorProfile;
  final String creatorName;
  final String description;
  final String videoUrl;
  final VideoSource videoSource;
  final String title;
  final int likes;
  final int views;

  ShortsEntity({
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
