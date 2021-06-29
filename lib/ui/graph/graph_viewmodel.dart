import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:partimap/app/app.locator.dart';
import 'package:partimap/app/app.router.dart';
import 'package:partimap/models/details_data.dart';
import 'package:partimap/models/graph.dart';
import 'package:partimap/services/firestore_service.dart';
import 'package:partimap/setup_dialog_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GraphViewModel extends StreamViewModel<Graph> {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _firestoreService = locator<FirestoreService>();

  String get id {
    var data = Uri.parse(_navigationService.currentRoute);
    var id = data.queryParameters['id'];

    if (id != null) {
      return id;
    } else {
      return 'Not found'; //!!!
    }
  }

  @override
  Stream<Graph> get stream => _firestoreService.listenToGraphRealTime(id);

  Graph get graph =>
      data ??
      Graph(
        name: '',
        specification: '',
        public: true,
        fadj: {0: []},
        ox: {0: 0.5},
        oy: {0: 0.5},
        title: {0: ''},
        description: {0: ''},
        color: {0: Colors.blue.value},
        icon: {0: 0},
        comments: {0: []},
      );

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

  List<double> _oxs = [0.5];
  List<double> _oys = [0.5];

  List<double> get oxs => _oxs;
  List<double> get oys => _oys;

  void move(int v, double ox, double oy) {
    if (ox < 0) {
      _oxs[v] = 0.0;
    } else if (ox > 1) {
      _oxs[v] = 1.0;
    } else {
      _oxs[v] = ox;
    }
    if (oy < 0) {
      _oys[v] = 0.0;
    } else if (oy > 1) {
      _oys[v] = 1.0;
    } else {
      _oys[v] = oy;
    }
    notifyListeners();
  }

  bool _start = true;
  Duration duration = Duration(milliseconds: 0);

  @override
  void onData(Graph? graph) async {
    //print('onData');
    if (graph != null) {
      _oxs = graph.ox.values.toList();
      _oys = graph.oy.values.toList();
      if (_start) {
        //await Future.delayed(Duration(milliseconds: 5));
        await openingAnimation(
          graph.ox.values.toList(),
          graph.oy.values.toList(),
        );
        _start = false;
        /*
        _oxs = oxs.map((e) => 0.5).toList();
        _oys = oys.map((e) => 0.5).toList();
        _start = false;
        notifyListeners();
        _oxs = graph.ox.values.toList();
        _oys = graph.oy.values.toList();
        notifyListeners();
        await Future.delayed(Duration(milliseconds: 500));
        duration = Duration(milliseconds: 0);
        */
      }
    }
  }

  Future addVertex(int v) async {
    var i = graph.fadj.length;
    var fadj = graph.fadj;
    fadj.putIfAbsent(i, () => [v]);
    var ox = {for (var i = 0; i < oxs.length; i++) i: oxs[i]};
    ox.putIfAbsent(i, () => oxs[v] > 0.5 ? oxs[v] - 0.1 : oxs[v] + 0.1);
    var oy = {for (var i = 0; i < oys.length; i++) i: oys[i]};
    oy.putIfAbsent(i, () => oys[v] > 0.5 ? oys[v] - 0.1 : oys[v] + 0.1);
    var title = graph.title;
    title.putIfAbsent(i, () => '');
    var description = graph.description;
    description.putIfAbsent(i, () => '');
    var color = graph.color;
    color.putIfAbsent(i, () => Colors.blue.value);
    var icon = graph.icon;
    icon.putIfAbsent(i, () => 0);
    var comments = graph.comments;
    comments.putIfAbsent(i, () => []);

    _firestoreService.updateGraph(
      id,
      Graph(
        name: graph.name,
        specification: graph.specification,
        public: graph.public,
        fadj: fadj,
        ox: ox,
        oy: oy,
        title: title,
        description: description,
        color: color,
        icon: icon,
        comments: comments,
      ),
    );
  }

  Future addUnconnectedVertex() async {
    var i = graph.fadj.length;
    var fadj = graph.fadj;
    fadj.putIfAbsent(i, () => []);
    var ox = {for (var i = 0; i < oxs.length; i++) i: oxs[i]};
    ox.putIfAbsent(i, () => 0.5);
    var oy = {for (var i = 0; i < oys.length; i++) i: oys[i]};
    oy.putIfAbsent(i, () => 0.5);
    var title = graph.title;
    title.putIfAbsent(i, () => '');
    var description = graph.description;
    description.putIfAbsent(i, () => '');
    var color = graph.color;
    color.putIfAbsent(i, () => Colors.blue.value);
    var icon = graph.icon;
    icon.putIfAbsent(i, () => 0);
    var comments = graph.comments;
    comments.putIfAbsent(i, () => []);

    _firestoreService.updateGraph(
      id,
      Graph(
        name: graph.name,
        specification: graph.specification,
        public: graph.public,
        fadj: fadj,
        ox: ox,
        oy: oy,
        title: title,
        description: description,
        color: color,
        icon: icon,
        comments: comments,
      ),
    );
  }

  Future removeVertex(int v) async {
    var copy = graph;
    var n = graph.fadj.length - 1;

    for (var e in copy.fadj.values) {
      e.removeWhere((element) => element == v);
    }

    if (v != n) {
      var fadj = copy.fadj[n];
      var ox = copy.ox[n];
      var oy = copy.oy[n];
      var title = copy.title[n];
      var description = copy.description[n];
      var color = copy.color[n];
      var icon = copy.icon[n];
      var comments = copy.comments[n];

      for (var e in copy.fadj.values) {
        if (e.contains(n)) {
          e.removeWhere((element) => element == n);
          e.add(v);
        }
      }

      copy.fadj[v]?.clear();
      copy.fadj[v]?.insertAll(0, fadj ?? []);
      copy.ox.update(v, (value) => ox ?? 0.5);
      copy.oy.update(v, (value) => oy ?? 0.5);
      copy.title.update(v, (value) => title ?? '');
      copy.description.update(v, (value) => description ?? '');
      copy.color.update(v, (value) => color ?? Colors.blue.value);
      copy.icon.update(v, (value) => icon ?? 0);
      copy.comments.update(v, (value) => comments ?? []);
    }

    copy.fadj.remove(n);
    copy.ox.remove(n);
    copy.oy.remove(n);
    copy.title.remove(n);
    copy.description.remove(n);
    copy.color.remove(n);
    copy.icon.remove(n);
    copy.comments.remove(n);

    _firestoreService.updateGraph(id, copy);
  }

  Future showDetailsDialog(int v) async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.details,
      mainButtonTitle: "Confirm",
      barrierDismissible: true,
      customData: DetailsDialogData(
        v,
        Graph(
          name: graph.name,
          specification: graph.specification,
          public: graph.public,
          fadj: graph.fadj,
          ox: _oxs.asMap(),
          oy: _oys.asMap(),
          title: graph.title,
          description: graph.description,
          color: graph.color,
          icon: graph.icon,
          comments: graph.comments,
        ),
      ),
    );

    if (response?.confirmed == true) {
      if (response?.responseData.remove == true) {
        removeVertex(v);
      } else {
        _firestoreService.updateGraph(id, response?.responseData.graph);
      }
    }

    notifyListeners();
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: Uri.base.toString()))
        .then((_) => showToast(
              'Link copied to clipboard',
              position: ToastPosition.center,
              textPadding: EdgeInsets.all(8),
              backgroundColor: Colors.black.withOpacity(0.8),
            ));
  }

  Future openingAnimation(List<double> xs, List<double> ys) async {
    for (var i = 0; i < 25; i++) {
      _oxs = xs.map((e) => 0.5 + ((4 * i) / 100) * (e - 0.5)).toList();
      _oys = ys.map((e) => 0.5 + ((4 * i) / 100) * (e - 0.5)).toList();
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 10));
    }
  }

  Future navigateToAboutView() async {
    _navigationService.navigateTo(Routes.aboutView);
  }

  Future navigateToShowcaseView() async {
    _navigationService.navigateTo(Routes.showcaseView);
  }

  Future showInfoDialog() async {
    await _dialogService.showDialog(
      title: "Info",
      description: """Tap once to customize a vertex.
Double tap to add vertices.
Hover over a vertex to see its description.""",
      buttonTitle: "OK",
      barrierDismissible: true,
      dialogPlatform: DialogPlatform.Material,
    );
  }
}
