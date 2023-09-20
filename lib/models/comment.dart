import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(createToJson: false)
class Comment {
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
