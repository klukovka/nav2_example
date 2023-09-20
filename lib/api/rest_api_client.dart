import 'package:dio/dio.dart';
import 'package:nav2_example/models/comment.dart';
import 'package:nav2_example/models/post.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class RestApiClient {
  factory RestApiClient(
    Dio dio, {
    String baseUrl,
  }) = _RestApiClient;

  @GET('/posts')
  Future<List<Post>> getPosts();

  @GET('/posts/{postId}')
  Future<Post> getPost(
    @Path('postId') String postId,
  );

  @GET('/posts/{postId}/comments')
  Future<List<Comment>> getCommentsForPost(
    @Path('postId') String postId,
  );
}
