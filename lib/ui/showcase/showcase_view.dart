import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/components/typography.dart';
import 'package:partimap/widgets/footer.dart';
import 'package:partimap/widgets/menu_bar.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';
import 'package:partimap/extensions/hover_extensions.dart';

import 'showcase_viewmodel.dart';

class ShowcaseView extends StatelessWidget {
  const ShowcaseView({Key? key}) : super(key: key);

  List<Widget> createGrid(ShowcaseViewModel model) {
    var list = <Widget>[];

    for (var i = 0; i < model.graphs.length; i++) {
      list.add(
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => model.navigateToGraphView(model.ids[i]),
            child: Card(
              elevation: 8,
              //clipBehavior: Clip.antiAlias,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: border),
                ),
                width: 200,
                height: 200,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      child: Center(
                        child: Text('Icon'),
                      ),
                    ),
                    Text(
                      model.graphs[i].name,
                      style: TextStyle(
                        fontSize: 24,
                        color: textPrimary,
                        fontFamily: fontFamily,
                      ),
                    ),
                    Spacer(),
                    Text(
                      model.graphs[i].specification,
                      style: TextStyle(
                        fontSize: 12,
                        color: textPrimary,
                        fontFamily: "Roboto",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ).moveUpOnHover,
          ),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShowcaseViewModel>.reactive(
      viewModelBuilder: () => ShowcaseViewModel(),
      builder: (
        BuildContext context,
        ShowcaseViewModel model,
        Widget? child,
      ) {
        var grid = createGrid(model);
        var blocks = <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 600,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: border),
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: EdgeInsets.all(40),
              child: model.isBusy
                  ? Center(child: CircularProgressIndicator())
                  : Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Text(
                              "Overview of some PARTIMAPS our users have created",
                              style: headlineSecondaryTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 32),
                            child: ResponsiveGridView.builder(
                              alignment: Alignment.center,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: grid.length,
                              gridDelegate: ResponsiveGridDelegate(
                                crossAxisExtent: 200,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                              ),
                              itemBuilder: (context, index) =>
                                  AnimationConfiguration.staggeredGrid(
                                delay: Duration(milliseconds: 150),
                                duration: const Duration(milliseconds: 800),
                                position: index,
                                columnCount: 5, //!!!
                                child: SlideAnimation(
                                  verticalOffset: 500,
                                  horizontalOffset: 500,
                                  child: grid[index],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          Footer(
            navigateToHome: () => model.navigateToHomeView(),
            navigateToAbout: () => model.navigateToAboutView(),
          ),
        ];
        return ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(
            context,
            Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, 66),
                child: MenuBar(
                  getStarted: () => model.showCreateDialog(),
                  navigateToAbout: () => model.navigateToAboutView(),
                ),
              ),
              body: ListView.builder(
                itemCount: blocks.length,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredList(
                  delay: Duration(milliseconds: 150),
                  duration: const Duration(milliseconds: 600),
                  position: index,
                  child: SlideAnimation(
                    verticalOffset: 100,
                    child: blocks[index],
                  ),
                ),
              ),
            ),
          ),
          defaultScale: true,
          minWidth: 480,
          defaultName: MOBILE,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.resize(600, name: MOBILE),
            ResponsiveBreakpoint.resize(850, name: TABLET),
            ResponsiveBreakpoint.resize(1080, name: DESKTOP),
          ],
          background: Container(color: background),
        );
      },
    );
  }
}
