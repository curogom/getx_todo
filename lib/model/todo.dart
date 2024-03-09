import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Todo extends Equatable {
  final String text;
  final TodoStatus status;

  const Todo({
    required this.text,
    TodoStatus? status,
  }) : status = status ?? TodoStatus.todo;

  @override
  List<Object?> get props => [text, status];

  Map<String, dynamic> toJson() => {'text': text, 'status': status.index};

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      text: map['text'] as String,
      status: TodoStatus.fromIndex(map['status']),
    );
  }

  Todo copyWith({
    String? text,
    TodoStatus? status,
  }) {
    return Todo(
      text: text ?? this.text,
      status: status ?? this.status,
    );
  }
}

enum TodoStatus {
  todo(Colors.blue),
  doing(Colors.green),
  done(Colors.grey);

  final MaterialColor color;

  const TodoStatus(this.color);

  factory TodoStatus.fromIndex(int index) {
    switch (index) {
      case 0:
        return TodoStatus.todo;
      case 1:
        return TodoStatus.doing;
      case 2:
        return TodoStatus.done;
      default:
        throw Exception('Invalid index');
    }
  }
}
