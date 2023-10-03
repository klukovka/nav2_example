part of 'posts_tab_bloc.dart';

enum PostsTabStatus {
  loading,
  success,
  error,
}

class PostsTabState extends Equatable {
  final PostsTabStatus status;
  final List<Post> posts;
  final String errorMessage;

  const PostsTabState({
    this.status = PostsTabStatus.loading,
    this.posts = const [],
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [status, posts, errorMessage];

  PostsTabState copyWith({
    PostsTabStatus? status,
    List<Post>? posts,
    String? errorMessage,
  }) {
    return PostsTabState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
