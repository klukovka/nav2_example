part of 'post_comments_page_cubit.dart';

enum PostCommentsPageStatus {
  loading,
  error,
  success,
}

class PostCommentsPageState extends Equatable {
  final PostCommentsPageStatus status;
  final List<Comment> comments;
  final Post post;
  final String errorMessage;

  const PostCommentsPageState({
    this.status = PostCommentsPageStatus.loading,
    this.comments = const [],
    this.post = const Post.empty(),
    this.errorMessage = '',
  });

  PostCommentsPageState copyWith({
    PostCommentsPageStatus? status,
    List<Comment>? comments,
    Post? post,
    String? errorMessage,
  }) {
    return PostCommentsPageState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      post: post ?? this.post,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, comments, post, errorMessage];
}
