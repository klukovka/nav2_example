part of 'post_comments_page_bloc.dart';

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
  final int? postId;

  const PostCommentsPageState({
    this.status = PostCommentsPageStatus.loading,
    this.comments = const [],
    this.post = const Post.empty(),
    this.errorMessage = '',
    this.postId,
  });

  PostCommentsPageState copyWith({
    PostCommentsPageStatus? status,
    List<Comment>? comments,
    Post? post,
    String? errorMessage,
    ValueGetter<int?>? postId,
  }) {
    return PostCommentsPageState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      post: post ?? this.post,
      errorMessage: errorMessage ?? this.errorMessage,
      postId: postId != null ? postId() : this.postId,
    );
  }

  @override
  List<Object?> get props {
    return [
      status,
      comments,
      post,
      errorMessage,
      postId,
    ];
  }
}
