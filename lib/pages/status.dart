import 'package:flutter/material.dart';
import 'package:story_app/data_model/data_model.dart';

class StoryDetailScreen extends StatelessWidget {
  final Story story;

  const StoryDetailScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width:
                MediaQuery.of(context).size.width, // Adjust the width as needed
            height: MediaQuery.of(context).size.height *
                0.5, // Adjust the height as needed
            child: isEmpty(story)
                ? Image.network(story.image)
                : Image.network(
                    'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg'),
          ),
          const SizedBox(height: 16.0),
          Text(story.title),
          // Add more content as needed
        ],
      ),
    );
  }
}

isEmpty(Story story) {
  if (story.image.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
