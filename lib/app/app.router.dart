// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/about/about_view.dart';
import '../ui/graph/graph_view.dart';
import '../ui/showcase/showcase_view.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String graphView = '/graph-view';
  static const String showcaseView = '/showcase-view';
  static const String aboutView = '/about-view';
  static const all = <String>{
    startupView,
    graphView,
    showcaseView,
    aboutView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.graphView, page: GraphView),
    RouteDef(Routes.showcaseView, page: ShowcaseView),
    RouteDef(Routes.aboutView, page: AboutView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    GraphView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const GraphView(),
        settings: data,
      );
    },
    ShowcaseView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ShowcaseView(),
        settings: data,
      );
    },
    AboutView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AboutView(),
        settings: data,
      );
    },
  };
}
