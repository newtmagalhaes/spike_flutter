import 'dart:convert';

abstract class BaseJsonConverter<T> {
  Map<String, dynamic> toJson(T obj);

  T fromJson(Map<String, dynamic> json);

  List<T> fromJsonList(List<dynamic> json) =>
      json.map((e) => Map<String, dynamic>.from(e)).map(fromJson).toList();
}
