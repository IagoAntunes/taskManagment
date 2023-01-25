// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:taskcontrol/utils/const.dart';

class Task {
  String name;
  String description;
  bool check;
  TypeStatus status;

  Task({
    required this.name,
    required this.description,
    required this.check,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': name,
      'description': description,
      'isCheck': check.toString(),
      'stats': status.toString(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    TypeStatus statusAux;
    if (map['stats'] == 'ok') {
      statusAux = TypeStatus.ok;
    } else if (map['stats'] == 'edit') {
      statusAux = TypeStatus.edit;
    } else {
      statusAux = TypeStatus.closed;
    }

    bool toBoolean(String str, [bool strict = false]) {
      if (strict == true) {
        return str == '1' || str == 'true';
      }
      return str != '0' && str != 'false' && str != '';
    }

    return Task(
      name: map['title'] as String,
      description: map['description'] as String,
      check: toBoolean(map['ischeck']),
      status: statusAux,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
