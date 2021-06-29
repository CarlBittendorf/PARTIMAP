import 'package:flutter/material.dart';
import 'package:partimap/app/app.locator.dart';
import 'package:partimap/models/graph.dart';
import 'package:partimap/models/picker_item.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  int v;
  Graph graph;
  int numberOfComments;

  DetailsViewModel(this.v, this.graph)
      : numberOfComments = graph.comments[v]?.length ?? 0;

  List<List<int>> get badj {
    List<List<int>> list = [];

    for (var i = 0; i < graph.fadj.length; i++) {
      list.add([]);
    }

    for (var i = 0; i < graph.fadj.length; i++) {
      for (var v in graph.fadj[i] ?? <int>[]) {
        list[v].add(i);
      }
    }

    return list;
  }

  Color get color => Color(graph.color[v] ?? Colors.blue.value);

  List<NeighborPickerItem> get items {
    var list = <NeighborPickerItem>[];

    for (var i = 0; i < graph.fadj.length; i++) {
      if (i != v) {
        list.add(NeighborPickerItem(
            graph.title[i] != '' ? graph.title[i] ?? '' : 'Unnamed vertex', i));
      }
    }

    return list;
  }

  List<NeighborPickerItem> get selectedItems {
    var list = <NeighborPickerItem>[];

    for (var i in graph.fadj[v] ?? <int>[]) {
      if (i < v) {
        list.add(items[i]);
      } else {
        list.add(items[i - 1]); //[i + 1]
      }
    }

    return list;
  }

  void select(List<NeighborPickerItem> list) {
    var newList = <int>[];
    for (var item in list) {
      newList.add(item.index);
    }
    graph.fadj.update(v, (value) => newList);
    notifyListeners();
  }

  void changeTitle(String title) {
    graph.title[v] = title;
    notifyListeners();
  }

  void changeDescription(String description) {
    graph.description[v] = description;
    notifyListeners();
  }

  void changeColor(Color color) {
    graph.color[v] = color.value;
    notifyListeners();
  }

  void changeIcon(IconData? iconData) {
    if (iconData != null) {
      graph.icon[v] = iconData.codePoint;
    } else {
      graph.icon[v] = 0;
    }
    notifyListeners();
  }

  void changeComment(String comment) {
    var length = graph.comments[v]?.length ?? 0;
    if (length == numberOfComments) {
      graph.comments[v]?.add(comment);
    } else {
      graph.comments[v]?[numberOfComments] = comment;
    }
    notifyListeners();
  }

  Future<bool> showRemoveVertexDialog() async {
    var response = await _dialogService.showDialog(
      description: 'Are you sure that you want to remove this vertex?',
      cancelTitle: 'CANCEL',
      cancelTitleColor: Colors.black,
      buttonTitle: 'OK',
      buttonTitleColor: Colors.black,
      barrierDismissible: true,
      dialogPlatform: DialogPlatform.Material,
    );

    if (response?.confirmed == true) {
      return true;
    } else {
      return false;
    }
  }

  Future showRemoveCommentDialog(int index) async {
    var response = await _dialogService.showDialog(
      description: 'Are you sure that you want to delete this comment?',
      cancelTitle: 'CANCEL',
      cancelTitleColor: Colors.black,
      buttonTitle: 'OK',
      buttonTitleColor: Colors.black,
      barrierDismissible: true,
      dialogPlatform: DialogPlatform.Material,
    );

    if (response?.confirmed == true) {
      graph.comments[v]?.removeAt(index);
      numberOfComments -= 1;
      notifyListeners();
    }
  }
}
