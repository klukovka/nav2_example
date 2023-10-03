import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/posts_tab/posts_tab_bloc.dart';
import 'package:nav2_example/config/di/locator.dart';
import 'package:nav2_example/pages/home_page/views/post_tile.dart';

class PostsTab extends StatelessWidget {
  const PostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PostsTabBloc>()..add(UploadPostsTabEvent()),
      child: BlocBuilder<PostsTabBloc, PostsTabState>(
        builder: (context, state) {
          return switch (state.status) {
            PostsTabStatus.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            PostsTabStatus.success => ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                itemBuilder: (context, index) => PostTile(
                  post: state.posts[index],
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.posts.length,
              ),
            PostsTabStatus.error => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => context
                          .read<PostsTabBloc>()
                          .add(UploadPostsTabEvent()),
                      icon: const Icon(Icons.replay_outlined),
                    ),
                    const SizedBox(height: 12),
                    Text(state.errorMessage),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
