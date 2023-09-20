import 'package:flutter/material.dart';
import 'package:nav2_example/models/post.dart';

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 36,
          child: Text(
            post.id.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Divider(),
              Text(
                post.body,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
