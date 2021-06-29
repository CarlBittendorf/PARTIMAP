import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partimap/models/graph.dart';

class FirestoreService {
  final CollectionReference<Map<String, dynamic>> _graphCollection =
      FirebaseFirestore.instance.collection('graphs');

  Future getGraphs() async {
    try {
      var documents = await _graphCollection.get();
      if (documents.docs.isNotEmpty) {
        var graphs = documents.docs
            .map((e) => Graph.fromJson(e.data()))
            .where((element) => element.public)
            .toList();
        var ids = documents.docs
            .where((e) => Graph.fromJson(e.data()).public)
            .map((e) => e.id)
            .toList();
        return {'graphs': graphs, 'ids': ids};
      }
    } catch (e) {
      print(e);
    }
  }

  Future addGraph(String name, String specification, bool public) async {
    try {
      var reference = await _graphCollection.add(Graph(
        name: name,
        specification: specification,
        public: public,
        fadj: {0: []},
        ox: {0: 0.5},
        oy: {0: 0.5},
        title: {0: ''},
        description: {0: ''},
        color: {0: Colors.blue.value},
        icon: {0: 0},
        comments: {0: []},
      ).toJson());
      return reference;
    } catch (e) {
      return e.toString();
    }
  }

  Future updateGraph(String id, Graph graph) async {
    try {
      await _graphCollection.doc(id).update(graph.toJson());
      return true;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Stream<Graph> listenToGraphRealTime(String id) async* {
    var graph = Graph(
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
    await for (var item in _graphCollection.doc(id).snapshots()) {
      var data = item.data();
      if (data != null) {
        graph = Graph.fromJson(data);
        yield graph;
      }
    }
  }
}
