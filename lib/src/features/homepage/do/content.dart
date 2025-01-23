abstract class Content {
  final String creatorName;
  final String creatorRef;
  final UserType creatorType;

  final String ownerName;
  final String ownerRef;
  final UserType ownerType;

  Content({
    required this.creatorName,
    required this.creatorRef,
    this.creatorType = UserType.user,
    required this.ownerName,
    required this.ownerRef,
    this.ownerType = UserType.user,
  });
}

enum UserType {
  institute,
  user, // should i convert this to 'user'
}
