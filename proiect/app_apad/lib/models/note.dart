import 'dart:convert';

class Note {
  late final int? id;
  final String title;
  final String detail;
  final DateTime dateTime;
  Note({
    this.id,
    required this.title,
    required this.detail,
    required this.dateTime
  });

  Note copyWith({
    int? id,
    String? title,
    String? detail,
    DateTime? dateTime
  }){
    return Note(id: id ?? this.id,
        title: title ?? this.title,
        detail: detail ?? this.detail,
        dateTime: dateTime ?? this.dateTime);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'time': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map){
    return Note(
        id: map['id']?.toInt(),
        title: map['title'] ?? '',
        detail: map['detail'] ?? '',
        dateTime: DateTime.fromMicrosecondsSinceEpoch(int.parse(map['time'])));
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'detail': detail,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory Note.fromJson(String source) => Note.fromMap(jsonDecode(source));

}