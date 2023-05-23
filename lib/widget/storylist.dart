import 'package:flutter/material.dart';
import 'package:story_app/data_model/data_model.dart';
import 'package:story_app/pages/status.dart';

class StoryListWidget extends StatefulWidget {
  final List<Story> stories;

  const StoryListWidget({Key? key, required this.stories}) : super(key: key);

  @override
  State<StoryListWidget> createState() => _StoryListWidgetState();
}

class _StoryListWidgetState extends State<StoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.stories.length,
      itemBuilder: (context, index) {
        final story = widget.stories[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(story.profile.image),
          ),
          title: Text(story.title),
          onTap: () async {
            // Navigate to the next page
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StoryDetailScreen(story: story),
              ),
            );
            
            setState(() {
              story.readStatus = true;
            });
          },
          trailing: story.readStatus
              ? const Icon(Icons.done)
              : const Icon(Icons.circle, color: Colors.blue),
        );
      },
    );
  }
}
