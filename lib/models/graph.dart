import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph.freezed.dart';
part 'graph.g.dart';

@freezed
class Graph with _$Graph {
  Graph._();

  factory Graph({
    required String name,
    required String specification,
    required bool public,
    required Map<int, List<int>> fadj,
    required Map<int, double> ox,
    required Map<int, double> oy,
    required Map<int, String> title,
    required Map<int, String> description,
    required Map<int, int> color,
    required Map<int, int> icon,
    required Map<int, List<String>> comments,
  }) = _Graph;

  factory Graph.fromJson(Map<String, dynamic> json) => _$GraphFromJson(json);
}
