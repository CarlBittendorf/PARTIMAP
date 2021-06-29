import 'package:flutter/material.dart';
import 'package:partimap/app/app.locator.dart';
import 'package:partimap/components/colors.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: backgroundDark,
    textColor: Colors.white,
  ));
}
