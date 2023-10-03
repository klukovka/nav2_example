part of 'posts_tab_bloc.dart';

sealed class PostsTabEvent extends Equatable {
  const PostsTabEvent();

  @override
  List<Object> get props => [];
}

class UploadPostsTabEvent extends PostsTabEvent {}
