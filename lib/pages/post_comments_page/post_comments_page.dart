import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/post_comments_page/post_comments_page_bloc.dart';
import 'package:nav2_example/pages/post_comments_page/comment_tile.dart';

class PostCommentsPage extends StatelessWidget {
  const PostCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentsPageBloc, PostCommentsPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Comments'),
          ),
          body: switch (state.status) {
            PostCommentsPageStatus.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            PostCommentsPageStatus.success => ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                itemBuilder: (context, index) => CommentTile(
                  comment: state.comments[index],
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.comments.length,
              ),
            PostCommentsPageStatus.error => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => context
                          .read<PostCommentsPageBloc>()
                          .add(const ReloadPostCommentsPageEvent()),
                      icon: const Icon(Icons.replay_outlined),
                    ),
                    const SizedBox(height: 12),
                    Text(state.errorMessage),
                  ],
                ),
              ),
          },
        );
      },
    );
  }
}
