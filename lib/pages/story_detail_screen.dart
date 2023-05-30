import 'package:flutter/material.dart';
import 'package:story_app/data_model/data_model.dart';
import 'package:story_app/widget/image_widget.dart';

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


