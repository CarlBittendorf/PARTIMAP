import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/components/typography.dart';
import 'package:partimap/models/details_response.dart';
import 'package:partimap/models/picker_item.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'details_viewmodel.dart';

class DetailsView extends HookWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DetailsView(this.request, this.completer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var v = request.customData.index;
    var titleController = useTextEditingController()
      ..text = request.customData.graph.title[v];
    var descriptionController = useTextEditingController()
      ..text = request.customData.graph.description[v];
    var commentController = useTextEditingController();
    return ViewModelBuilder<DetailsViewModel>.reactive(
      viewModelBuilder: () => DetailsViewModel(v, request.customData.graph),
      builder: (
        BuildContext context,
        DetailsViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Details',
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpandablePanel(
                          theme: ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                          ),
                          header: Text(
                            'Title',
                            style: bodyTextStyle,
                          ),
                          collapsed: Container(),
                          expanded: Column(
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  labelText: "Title",
                                  alignLabelWithHint: false,
                                  filled: true,
                                ),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.text,
                                minLines: 1,
                                maxLines: 1,
                                controller: titleController,
                                onChanged: (title) => model.changeTitle(title),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpandablePanel(
                          theme: ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                          ),
                          header: Text(
                            'Description',
                            style: bodyTextStyle,
                          ),
                          collapsed: Container(),
                          expanded: Column(
                            children: [
                              SizedBox(height: 4),
                              TextField(
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
                                maxLines: 18,
                                controller: descriptionController,
                                onChanged: (description) =>
                                    model.changeDescription(description),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => showMaterialCheckboxPicker(
                          context: context,
                          title: 'Pick neighbors',
                          headerColor: Colors.white,
                          headerTextColor: Colors.black,
                          maxLongSide: 400,
                          items: model.items,
                          selectedItems: model.selectedItems,
                          onChanged: (List<NeighborPickerItem> value) =>
                              model.select(value),
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExpandablePanel(
                              theme: ExpandableThemeData(
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: false,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                tapHeaderToExpand: false,
                              ),
                              header: Text(
                                'Neighbors',
                                style: bodyTextStyle,
                              ),
                              collapsed: Container(),
                              expanded: Container(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => showMaterialSwatchPicker(
                          context: context,
                          headerColor: Colors.white,
                          headerTextColor: Colors.black,
                          maxLongSide: 400,
                          selectedColor: model.color,
                          onChanged: (color) => model.changeColor(color),
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExpandablePanel(
                              theme: ExpandableThemeData(
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: false,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                tapHeaderToExpand: false,
                              ),
                              header: Text(
                                'Color',
                                style: bodyTextStyle,
                              ),
                              collapsed: Container(),
                              expanded: Container(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          var iconData = await FlutterIconPicker.showIconPicker(
                            context,
                            title: Text(
                              'Pick an icon',
                              textAlign: TextAlign.center,
                            ),
                            closeChild: Text(
                              'NO ICON',
                              style: TextStyle(color: Colors.black),
                              //textScaleFactor: 1.25,
                            ),
                          );
                          model.changeIcon(iconData);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExpandablePanel(
                              theme: ExpandableThemeData(
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: false,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                tapHeaderToExpand: false,
                              ),
                              header: Text(
                                'Icon',
                                style: bodyTextStyle,
                              ),
                              collapsed: Container(),
                              expanded: Container(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpandablePanel(
                          theme: ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                          ),
                          header: Text(
                            'Comments',
                            style: bodyTextStyle,
                          ),
                          collapsed: Container(),
                          expanded: Container(
                            child: Builder(
                              builder: (context) {
                                var list = <Widget>[];
                                list.add(
                                  SizedBox(
                                    height: 4,
                                  ),
                                );
                                if (model.graph.comments[v]?.isNotEmpty ??
                                    false) {
                                  var length =
                                      model.graph.comments[v]?.length ?? 0;
                                  for (var i = 0; i < length; i++) {
                                    list.add(
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (i != length - 1) {
                                              model.showRemoveCommentDialog(i);
                                            }
                                          }, // remove dialog
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(color: border),
                                            ),
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              model.graph.comments[v]?[i] ?? '',
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                    list.add(
                                      SizedBox(
                                        height: 8,
                                      ),
                                    );
                                  }
                                }

                                return Column(children: list);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpandablePanel(
                          theme: ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                          ),
                          header: Text(
                            'Enter a comment',
                            style: bodyTextStyle,
                          ),
                          collapsed: Container(),
                          expanded: Column(
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  labelText: "Comment",
                                  alignLabelWithHint: false,
                                  filled: true,
                                ),
                                textInputAction: TextInputAction.newline,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 5,
                                controller: commentController,
                                onChanged: (comment) =>
                                    model.changeComment(comment),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          var value = await model.showRemoveVertexDialog();
                          if (value) {
                            completer(
                              DialogResponse(
                                confirmed: true,
                                responseData:
                                    DetailsDialogResponse(true, model.graph),
                              ),
                            );
                          }
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExpandablePanel(
                              theme: ExpandableThemeData(
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: false,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                tapHeaderToExpand: false,
                              ),
                              header: Text(
                                'Delete',
                                style: bodyTextStyle,
                              ),
                              collapsed: Container(),
                              expanded: Container(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => completer(
                          DialogResponse(
                            confirmed: true,
                            responseData: DetailsDialogResponse(
                              false,
                              model.graph,
                            ),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/*
                    SearchableDropdown.multiple(
                      items: model.olditems,
                      selectedItems: model.graph.fadj[v],
                      onChanged: (value) => model.select(value),
                      hint: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Choose"),
                      ),
                      searchHint: "Choose",
                      doneButton: "Done",
                      closeButton: (selectedItems) {
                        return (selectedItems.isNotEmpty
                            ? "Save (${selectedItems.length.toString()})"
                            : "Save without selection");
                      },
                      isExpanded: true,
                      dialogBox: false,
                      menuConstraints:
                          BoxConstraints.tight(Size.fromHeight(500)),
                    ),




                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton.extended(
                            label: Text("Delete"),
                            backgroundColor: Colors.red,
                            icon: Icon(Icons.delete),
                            onPressed: () => completer(
                              DialogResponse(
                                confirmed: true,
                                responseData:
                                    DetailsDialogResponse(true, model.graph),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton.extended(
                            label: Text(request.mainButtonTitle ?? 'Confirm'),
                            backgroundColor: Colors.greenAccent[700],
                            icon: Icon(Icons.check),
                            onPressed: () => completer(
                              DialogResponse(
                                confirmed: true,
                                responseData: DetailsDialogResponse(
                                  false,
                                  model.graph,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    */
