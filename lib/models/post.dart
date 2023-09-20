import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(createToJson: false)
class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  const Post({
    required this.id,
    required this.title,
    required this.body,
  });

  const Post.empty()
      : id = -1,
        title = '',
        body = '';

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  @override
  List<Object> get props => [id, title, body];
}
