import 'package:flutter/material.dart';
import 'package:story_app/api/get_status.dart';
import 'package:story_app/data_model/data_model.dart';
import 'package:story_app/widget/story_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<Map<int, List<Story>>> (
        future: fetchStories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Social Media App'),
              ),
              body: StoryListWidget(stories: snapshot.data!),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

