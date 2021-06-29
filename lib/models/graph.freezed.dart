// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Graph _$GraphFromJson(Map<String, dynamic> json) {
  return _Graph.fromJson(json);
}

/// @nodoc
class _$GraphTearOff {
  const _$GraphTearOff();

  _Graph call(
      {required String name,
      required String specification,
      required bool public,
      required Map<int, List<int>> fadj,
      required Map<int, double> ox,
      required Map<int, double> oy,
      required Map<int, String> title,
      required Map<int, String> description,
      required Map<int, int> color,
      required Map<int, int> icon,
      required Map<int, List<String>> comments}) {
    return _Graph(
      name: name,
      specification: specification,
      public: public,
      fadj: fadj,
      ox: ox,
      oy: oy,
      title: title,
      description: description,
      color: color,
      icon: icon,
      comments: comments,
    );
  }

  Graph fromJson(Map<String, Object> json) {
    return Graph.fromJson(json);
  }
}

/// @nodoc
const $Graph = _$GraphTearOff();

/// @nodoc
mixin _$Graph {
  String get name => throw _privateConstructorUsedError;
  String get specification => throw _privateConstructorUsedError;
  bool get public => throw _privateConstructorUsedError;
  Map<int, List<int>> get fadj => throw _privateConstructorUsedError;
  Map<int, double> get ox => throw _privateConstructorUsedError;
  Map<int, double> get oy => throw _privateConstructorUsedError;
  Map<int, String> get title => throw _privateConstructorUsedError;
  Map<int, String> get description => throw _privateConstructorUsedError;
  Map<int, int> get color => throw _privateConstructorUsedError;
  Map<int, int> get icon => throw _privateConstructorUsedError;
  Map<int, List<String>> get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraphCopyWith<Graph> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphCopyWith<$Res> {
  factory $GraphCopyWith(Graph value, $Res Function(Graph) then) =
      _$GraphCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String specification,
      bool public,
      Map<int, List<int>> fadj,
      Map<int, double> ox,
      Map<int, double> oy,
      Map<int, String> title,
      Map<int, String> description,
      Map<int, int> color,
      Map<int, int> icon,
      Map<int, List<String>> comments});
}

/// @nodoc
class _$GraphCopyWithImpl<$Res> implements $GraphCopyWith<$Res> {
  _$GraphCopyWithImpl(this._value, this._then);

  final Graph _value;
  // ignore: unused_field
  final $Res Function(Graph) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? specification = freezed,
    Object? public = freezed,
    Object? fadj = freezed,
    Object? ox = freezed,
    Object? oy = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? icon = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specification: specification == freezed
          ? _value.specification
          : specification // ignore: cast_nullable_to_non_nullable
              as String,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      fadj: fadj == freezed
          ? _value.fadj
          : fadj // ignore: cast_nullable_to_non_nullable
              as Map<int, List<int>>,
      ox: ox == freezed
          ? _value.ox
          : ox // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      oy: oy == freezed
          ? _value.oy
          : oy // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Map<int, List<String>>,
    ));
  }
}

/// @nodoc
abstract class _$GraphCopyWith<$Res> implements $GraphCopyWith<$Res> {
  factory _$GraphCopyWith(_Graph value, $Res Function(_Graph) then) =
      __$GraphCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String specification,
      bool public,
      Map<int, List<int>> fadj,
      Map<int, double> ox,
      Map<int, double> oy,
      Map<int, String> title,
      Map<int, String> description,
      Map<int, int> color,
      Map<int, int> icon,
      Map<int, List<String>> comments});
}

/// @nodoc
class __$GraphCopyWithImpl<$Res> extends _$GraphCopyWithImpl<$Res>
    implements _$GraphCopyWith<$Res> {
  __$GraphCopyWithImpl(_Graph _value, $Res Function(_Graph) _then)
      : super(_value, (v) => _then(v as _Graph));

  @override
  _Graph get _value => super._value as _Graph;

  @override
  $Res call({
    Object? name = freezed,
    Object? specification = freezed,
    Object? public = freezed,
    Object? fadj = freezed,
    Object? ox = freezed,
    Object? oy = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? icon = freezed,
    Object? comments = freezed,
  }) {
    return _then(_Graph(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specification: specification == freezed
          ? _value.specification
          : specification // ignore: cast_nullable_to_non_nullable
              as String,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      fadj: fadj == freezed
          ? _value.fadj
          : fadj // ignore: cast_nullable_to_non_nullable
              as Map<int, List<int>>,
      ox: ox == freezed
          ? _value.ox
          : ox // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      oy: oy == freezed
          ? _value.oy
          : oy // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Map<int, List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Graph extends _Graph {
  _$_Graph(
      {required this.name,
      required this.specification,
      required this.public,
      required this.fadj,
      required this.ox,
      required this.oy,
      required this.title,
      required this.description,
      required this.color,
      required this.icon,
      required this.comments})
      : super._();

  factory _$_Graph.fromJson(Map<String, dynamic> json) =>
      _$_$_GraphFromJson(json);

  @override
  final String name;
  @override
  final String specification;
  @override
  final bool public;
  @override
  final Map<int, List<int>> fadj;
  @override
  final Map<int, double> ox;
  @override
  final Map<int, double> oy;
  @override
  final Map<int, String> title;
  @override
  final Map<int, String> description;
  @override
  final Map<int, int> color;
  @override
  final Map<int, int> icon;
  @override
  final Map<int, List<String>> comments;

  @override
  String toString() {
    return 'Graph(name: $name, specification: $specification, public: $public, fadj: $fadj, ox: $ox, oy: $oy, title: $title, description: $description, color: $color, icon: $icon, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Graph &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.specification, specification) ||
                const DeepCollectionEquality()
                    .equals(other.specification, specification)) &&
            (identical(other.public, public) ||
                const DeepCollectionEquality().equals(other.public, public)) &&
            (identical(other.fadj, fadj) ||
                const DeepCollectionEquality().equals(other.fadj, fadj)) &&
            (identical(other.ox, ox) ||
                const DeepCollectionEquality().equals(other.ox, ox)) &&
            (identical(other.oy, oy) ||
                const DeepCollectionEquality().equals(other.oy, oy)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(specification) ^
      const DeepCollectionEquality().hash(public) ^
      const DeepCollectionEquality().hash(fadj) ^
      const DeepCollectionEquality().hash(ox) ^
      const DeepCollectionEquality().hash(oy) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(comments);

  @JsonKey(ignore: true)
  @override
  _$GraphCopyWith<_Graph> get copyWith =>
      __$GraphCopyWithImpl<_Graph>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GraphToJson(this);
  }
}

abstract class _Graph extends Graph {
  factory _Graph(
      {required String name,
      required String specification,
      required bool public,
      required Map<int, List<int>> fadj,
      required Map<int, double> ox,
      required Map<int, double> oy,
      required Map<int, String> title,
      required Map<int, String> description,
      required Map<int, int> color,
      required Map<int, int> icon,
      required Map<int, List<String>> comments}) = _$_Graph;
  _Graph._() : super._();

  factory _Graph.fromJson(Map<String, dynamic> json) = _$_Graph.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get specification => throw _privateConstructorUsedError;
  @override
  bool get public => throw _privateConstructorUsedError;
  @override
  Map<int, List<int>> get fadj => throw _privateConstructorUsedError;
  @override
  Map<int, double> get ox => throw _privateConstructorUsedError;
  @override
  Map<int, double> get oy => throw _privateConstructorUsedError;
  @override
  Map<int, String> get title => throw _privateConstructorUsedError;
  @override
  Map<int, String> get description => throw _privateConstructorUsedError;
  @override
  Map<int, int> get color => throw _privateConstructorUsedError;
  @override
  Map<int, int> get icon => throw _privateConstructorUsedError;
  @override
  Map<int, List<String>> get comments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GraphCopyWith<_Graph> get copyWith => throw _privateConstructorUsedError;
}
