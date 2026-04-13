import 'package:flutter/material.dart';

enum TaskStatus { todo, doing, done }

class Task {
  String id;
  String title;
  TaskStatus status;

  Task({
    required this.title,
    this.status = TaskStatus.todo,
  }) : id = UniqueKey().toString();
}