import 'package:flutter/material.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:partimap/extensions/translate_on_hover.dart';

extension HoverExtensions on Widget {
  static final appContainer =
      html.window.document.getElementById("app-container");

  Widget get showCursorOnHover {
    return MouseRegion(
      onHover: (event) => appContainer?.style.cursor = "pointer",
      onExit: (event) => appContainer?.style.cursor = "default",
      child: this,
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(child: this);
  }
}
