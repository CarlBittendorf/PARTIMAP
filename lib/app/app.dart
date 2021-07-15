import 'package:partimap/services/firestore_service.dart';
import 'package:partimap/ui/about/about_view.dart';
import 'package:partimap/ui/graph/graph_view.dart';
import 'package:partimap/ui/imprint/imprint_view.dart';
import 'package:partimap/ui/showcase/showcase_view.dart';
import 'package:partimap/ui/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: GraphView),
    MaterialRoute(page: ShowcaseView),
    MaterialRoute(page: AboutView),
    MaterialRoute(page: ImprintView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: FirestoreService),
  ],
)
class AppSetup {}
