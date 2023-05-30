import 'package:story_app/data_model/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<int, List<Story>>> fetchStories() async {
  final response =
      await http.get(Uri.parse('http://my-json-server.typicode.com/shakeebM/StoriesApi/stories'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);

    final Map<int, List<Story>> storiesByProfile = {};

    for (var i = 0; i < data.length; i++) {
      final item = data[i];
      final story = Story(
        id: item['id'],
        title: item['title'] ?? '',
        readStatus: item['read_status'] ?? false,
        image: item['image'] ?? '',
        profile: UserProfile(
          id: item['profile']['id'],
          name: item['profile']['name'] ?? '',
          image: item['profile']['image'] ?? '',
        ),
      );

      if (storiesByProfile.containsKey(story.profile.id)) {
        storiesByProfile[story.profile.id]!.add(story);
        print(storiesByProfile);
      } else {
        storiesByProfile[story.profile.id] = [story];
      }
    }

    return storiesByProfile;
  } else {
    throw Exception('Failed to fetch stories');
  }
}


