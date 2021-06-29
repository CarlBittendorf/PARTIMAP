import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:partimap/app/app.locator.dart';
import 'package:partimap/setup_dialog_ui.dart';
import 'package:partimap/setup_snackbar_ui.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/app.router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupDialogUi();
  setupSnackbarUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'PARTIMAP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: [StackedService.routeObserver],
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
