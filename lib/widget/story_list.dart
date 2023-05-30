import 'package:flutter/material.dart';
import 'package:story_app/data_model/data_model.dart';
import 'package:story_app/pages/status.dart';

class StoryListWidget extends StatefulWidget {
  final Map<int, List<Story>> stories;

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
        final profileStories = widget.stories.values.toList()[index];
        final story = profileStories[0];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(story.profile.image),
          ),
          title: Text(story.profile.name),
          onTap: () async {
            // Navigate to the next page
            final statusRead = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StoryDetailScreen(story: profileStories),
              ),
            );

            setState(() {
              if (statusRead != null) {
                story.readStatus = statusRead;
              }
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
