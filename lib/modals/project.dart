import 'package:flutter/foundation.dart';

class Project {
  final int userId, id;
  final String name, description, due_date, deleted_at, created_at, updated_at;
  final bool status;

  Project(
    this.userId,
    this.id,
    this.name,
    this.description,
    this.due_date,
    this.deleted_at,
    this.created_at,
    this.updated_at,
    this.status,
  );

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      json['userId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['due_date'] as String,
      json['deleted_at'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['status'] as bool,

    );
  }
}
