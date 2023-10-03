import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/navigation/navigation_bloc.dart';
import 'package:nav2_example/config/navigation/routes/post_comment_route.dart';
import 'package:nav2_example/models/post.dart';

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        context.read<NavigationBloc>().add(
              OpenPageNavigationEvent(PostCommentRoute.path, {
                'id': post.id,
              }),
            );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
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
        ),
      ),
    );
  }
}
