import 'package:story_app/data_model/user_profile.dart';

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

