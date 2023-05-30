import 'package:flutter/material.dart';
import 'package:story_app/data_model/data_model.dart';

class StoryDetailScreen extends StatefulWidget {
  final List<Story> story;

  const StoryDetailScreen({super.key, required this.story});

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stories"),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = (currentIndex + 1) % widget.story.length;
              if (currentIndex == 0) {
                Navigator.pop(context,true);
              }
            });
          },
          child: Container(
            color: Colors.white,
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: buildImageorText(widget.story, context, currentIndex),
              ),
            ),
          ),
        ));
  }
}

Widget buildImageorText(List<Story> story, BuildContext context, currentIndex) {
  final currentImage = story[currentIndex].image;
  final currentTitle = story[currentIndex].title; 
  if (currentImage.isNotEmpty) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(currentImage,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4),
        Text(currentTitle)
      ],
    );
  } else {
    return Center(
      child: Text(currentTitle),
    );
  }
}
