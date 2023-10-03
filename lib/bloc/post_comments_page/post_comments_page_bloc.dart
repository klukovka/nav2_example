import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/models/comment.dart';
import 'package:nav2_example/models/post.dart';
import 'package:nav2_example/services/posts_service.dart';

part 'post_comments_page_event.dart';
part 'post_comments_page_state.dart';

@injectable
class PostCommentsPageBloc
    extends Bloc<PostCommentsPageEvent, PostCommentsPageState> {
  final PostsService _postsService;

  PostCommentsPageBloc(this._postsService)
      : super(const PostCommentsPageState()) {
    on<UploadPostCommentsPageEvent>(upload);
    on<ReloadPostCommentsPageEvent>(reload);
  }

  Future<void> upload(
    UploadPostCommentsPageEvent event,
    Emitter<PostCommentsPageState> emit,
  ) async {
    emit(state.copyWith(
      status: PostCommentsPageStatus.loading,
      postId: () => event.id,
    ));
    await _upload(event.id, emit);
  }

  Future<void> reload(
    ReloadPostCommentsPageEvent event,
    Emitter<PostCommentsPageState> emit,
  ) async {
    if (state.postId == null) return;
    emit(state.copyWith(
      status: PostCommentsPageStatus.loading,
    ));
    await _upload(state.postId!, emit);
  }

  Future<void> _upload(
    int id,
    Emitter<PostCommentsPageState> emit,
  ) async {
    try {
      final comments = await _postsService.getCommentsForPost(id);
      final post = await _postsService.getPost(id);
      emit(state.copyWith(
        comments: comments,
        post: post,
        status: PostCommentsPageStatus.success,
      ));
    } catch (ex) {
      emit(state.copyWith(
        errorMessage: ex.toString(),
        status: PostCommentsPageStatus.success,
      ));
    }
  }
}
