import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/models/comment.dart';
import 'package:nav2_example/models/post.dart';
import 'package:nav2_example/services/posts_service.dart';

part 'post_comments_page_state.dart';

@injectable
class PostCommentsPageCubit extends Cubit<PostCommentsPageState> {
  final PostsService _postsService;
  late final int _postId;

  PostCommentsPageCubit(
    this._postsService,
    @factoryParam int? postId,
  ) : super(const PostCommentsPageState()) {
    _postId = postId!;
    upload();
  }

  Future<void> upload() async {
    emit(state.copyWith(status: PostCommentsPageStatus.loading));
    try {
      final comments = await _postsService.getCommentsForPost(_postId);
      final post = await _postsService.getPost(_postId);
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
