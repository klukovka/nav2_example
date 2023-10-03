part of 'post_comments_page_bloc.dart';

sealed class PostCommentsPageEvent extends Equatable {
  const PostCommentsPageEvent();
}

class UploadPostCommentsPageEvent extends PostCommentsPageEvent {
  final int id;

  const UploadPostCommentsPageEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class ReloadPostCommentsPageEvent extends PostCommentsPageEvent {
  const ReloadPostCommentsPageEvent();

  @override
  List<Object?> get props => [];
}
