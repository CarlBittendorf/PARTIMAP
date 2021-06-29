import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:partimap/models/create_response.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'create_viewmodel.dart';

class CreateView extends HookWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CreateView(this.request, this.completer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = useTextEditingController();
    var specificationController = useTextEditingController();
    return ViewModelBuilder<CreateViewModel>.reactive(
      viewModelBuilder: () => CreateViewModel(),
      builder: (
        BuildContext context,
        CreateViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stepper(
                    type: StepperType.vertical,
                    currentStep: model.currentStep,
                    onStepContinue: () => model.currentStep < 2
                        ? model.increaseStep()
                        : completer(
                            DialogResponse(
                              confirmed: true,
                              responseData: CreateDialogResponse(
                                  model.name,
                                  model.specification,
                                  model.radioValue == 0 ? true : false),
                            ),
                          ),
                    onStepCancel: () => completer(
                      DialogResponse(confirmed: true),
                    ),
                    steps: [
                      Step(
                        title: Text('Choose a name'),
                        isActive: true,
                        content: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  labelText: "Name",
                                  alignLabelWithHint: false,
                                  filled: true,
                                ),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.text,
                                minLines: 1,
                                maxLines: 1,
                                controller: nameController,
                                onChanged: (value) => model.changeName(value),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        title: Text('Enter a description'),
                        isActive: true,
                        content: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  labelText: "Description",
                                  alignLabelWithHint: false,
                                  filled: true,
                                ),
                                textInputAction: TextInputAction.newline,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 5,
                                controller: specificationController,
                                onChanged: (value) =>
                                    model.changeSpecification(value),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        title: Text('Decide the visibility'),
                        isActive: true,
                        content: Column(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: model.radioValue,
                                  onChanged: (int? value) =>
                                      model.changeValue(value ?? 1),
                                ),
                                Text('public'),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: model.radioValue,
                                  onChanged: (int? value) =>
                                      model.changeValue(value ?? 0),
                                ),
                                Text('private'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
