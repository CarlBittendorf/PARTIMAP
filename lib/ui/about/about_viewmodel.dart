import 'package:partimap/app/app.locator.dart';
import 'package:partimap/app/app.router.dart';
import 'package:partimap/services/firestore_service.dart';
import 'package:partimap/setup_dialog_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AboutViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _firestoreService = locator<FirestoreService>();

  Future navigateToHomeView() async {
    _navigationService.navigateTo(Routes.startupView);
  }

  Future navigateToShowcaseView() async {
    _navigationService.navigateTo(Routes.showcaseView);
  }

  Future navigateToImprintView() async {
    _navigationService.navigateTo(Routes.imprintView);
  }

  Future showCreateDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.create,
      mainButtonTitle: "Confirm",
      barrierDismissible: true,
    );

    if (response?.confirmed == true) {
      var result = await _firestoreService.addGraph(response?.responseData.name,
          response?.responseData.specification, response?.responseData.public);
      if (result is String) {
        print(result);
      } else {
        _navigationService.navigateTo(
          Routes.graphView,
          parameters: <String, String>{"id": result.id.toString()},
        );
      }
    }
  }
}
