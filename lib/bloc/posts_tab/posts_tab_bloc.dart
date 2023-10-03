import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/models/post.dart';
import 'package:nav2_example/services/posts_service.dart';

part 'posts_tab_event.dart';
part 'posts_tab_state.dart';

@injectable
class PostsTabBloc extends Bloc<PostsTabEvent, PostsTabState> {
  final PostsService _postsService;

  PostsTabBloc(this._postsService) : super(const PostsTabState()) {
    on<UploadPostsTabEvent>(upload);
  }

  Future<void> upload(
    UploadPostsTabEvent event,
    Emitter<PostsTabState> emit,
  ) async {
    emit(state.copyWith(status: PostsTabStatus.loading));
    try {
      final posts = await _postsService.getPosts();
      emit(state.copyWith(
        posts: posts,
        status: PostsTabStatus.success,
      ));
    } catch (ex) {
      emit(state.copyWith(
        errorMessage: ex.toString(),
        status: PostsTabStatus.success,
      ));
    }
  }
}
