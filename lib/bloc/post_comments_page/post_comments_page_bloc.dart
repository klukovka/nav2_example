import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  }

  Future<void> upload(
    UploadPostCommentsPageEvent event,
    Emitter<PostCommentsPageState> emit,
  ) async {
    emit(state.copyWith(status: PostCommentsPageStatus.loading));
    try {
      final comments = await _postsService.getCommentsForPost(event.id);
      final post = await _postsService.getPost(event.id);
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
