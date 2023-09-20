import 'package:injectable/injectable.dart';
import 'package:nav2_example/api/rest_api_client.dart';
import 'package:nav2_example/models/comment.dart';
import 'package:nav2_example/models/post.dart';

@lazySingleton
class PostsService {
  final RestApiClient _apiClient;

  PostsService(this._apiClient);

  Future<List<Post>> getPosts() async {
    try {
      return await _apiClient.getPosts();
    } catch (_) {
      throw 'Failed to upload posts';
    }
  }

  Future<Post> getPost(int postId) async {
    try {
      return await _apiClient.getPost(postId);
    } catch (_) {
      throw 'Failed to upload post';
    }
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    try {
      return await _apiClient.getCommentsForPost(postId);
    } catch (_) {
      throw 'Failed to upload comments';
    }
  }
}
