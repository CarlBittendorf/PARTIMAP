// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Graph _$_$_GraphFromJson(Map<String, dynamic> json) {
  return _$_Graph(
    name: json['name'] as String,
    specification: json['specification'] as String,
    public: json['public'] as bool,
    fadj: (json['fadj'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          int.parse(k), (e as List<dynamic>).map((e) => e as int).toList()),
    ),
    ox: (json['ox'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
    ),
    oy: (json['oy'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
    ),
    title: (json['title'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
    description: (json['description'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
    color: (json['color'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(int.parse(k), e as int),
    ),
    icon: (json['icon'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(int.parse(k), e as int),
    ),
    comments: (json['comments'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          int.parse(k), (e as List<dynamic>).map((e) => e as String).toList()),
    ),
  );
}

Map<String, dynamic> _$_$_GraphToJson(_$_Graph instance) => <String, dynamic>{
      'name': instance.name,
      'specification': instance.specification,
      'public': instance.public,
      'fadj': instance.fadj.map((k, e) => MapEntry(k.toString(), e)),
      'ox': instance.ox.map((k, e) => MapEntry(k.toString(), e)),
      'oy': instance.oy.map((k, e) => MapEntry(k.toString(), e)),
      'title': instance.title.map((k, e) => MapEntry(k.toString(), e)),
      'description':
          instance.description.map((k, e) => MapEntry(k.toString(), e)),
      'color': instance.color.map((k, e) => MapEntry(k.toString(), e)),
      'icon': instance.icon.map((k, e) => MapEntry(k.toString(), e)),
      'comments': instance.comments.map((k, e) => MapEntry(k.toString(), e)),
    };
