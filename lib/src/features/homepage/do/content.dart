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

/// UserType will help the app to understand who owns a specific digital asset, an individual or an institute,
/// hereafter the term 'user' is used instead of individual, this helps in ease readability
/// This is first created to handle fetching of single assessment as it is saved in one collection, even the owner is an user or institute.
/// This make hark to find wheter the requested user/institute has access to the requested asset,
/// Inorder to find the currect owner, I(Afeef) has introduced this way.
/// Now the ownerRef and creatorRef fields of the digital asset is prefeixed with this values

enum UserType {
  /// this is user for non-living human beings (legal entities) like institutes, companies
  institute,

  /// this is used of individual human beings
  user,
}
