import 'package:story_app/data_model/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Story>> fetchStories() async {
  final response = await http.get(Uri.parse('http://my-json-server.typicode.com/shakeebM/StoriesApi/stories'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((item) {
      return Story(
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
    }).toList();
  } else {
    throw Exception('Failed to fetch stories');
  }
}
