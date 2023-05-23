class Story {
  final int id;
  final String title;
  bool readStatus;
  final String image;
  final UserProfile profile;

  Story({
    required this.id,
    required this.title,
    required this.readStatus,
    required this.image,
    required this.profile,
  });
}

class UserProfile {
  final int id;
  final String name;
  final String image;

  UserProfile({
    required this.id,
    required this.name,
    required this.image,
  });
}