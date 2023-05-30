import 'package:flutter/material.dart';
import 'package:story_app/data_model/data_model.dart';

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