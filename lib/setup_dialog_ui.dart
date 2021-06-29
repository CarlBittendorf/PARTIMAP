import 'package:partimap/ui/create/create_view.dart';
import 'package:partimap/ui/details/details_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';

enum DialogType { details, create }

void setupDialogUi() {
  var dialogService = locator<DialogService>();

  final builders = {
    DialogType.details: (context, sheetRequest, completer) =>
        DetailsView(sheetRequest, completer),
    DialogType.create: (context, sheetRequest, completer) =>
        CreateView(sheetRequest, completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
