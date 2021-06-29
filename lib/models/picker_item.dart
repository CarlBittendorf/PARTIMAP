import 'package:equatable/equatable.dart';

class NeighborPickerItem extends Equatable {
  final String name;
  final int index;

  @override
  String toString() {
    return name;
  }

  @override
  List<Object> get props => [name, index];

  NeighborPickerItem(this.name, this.index);
}
