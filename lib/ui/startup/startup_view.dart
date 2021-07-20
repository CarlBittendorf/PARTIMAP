import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/widgets/block_wrapper.dart';
import 'package:partimap/widgets/features.dart';
import 'package:partimap/widgets/footer.dart';
import 'package:partimap/widgets/get_started.dart';
import 'package:partimap/widgets/menu_bar.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      viewModelBuilder: () => StartupViewModel(),
      builder: (
        BuildContext context,
        StartupViewModel model,
        Widget? child,
      ) {
        var blocks = <Widget>[
          BlockWrapper(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 500),
                child: Card(
                  elevation: 16,
                  child: Image.asset(
                    "assets/images/screenshot.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          //SizedBox(height: 550),
          BlockWrapper(
            GetStarted(
              callback: () => model.showCreateDialog(),
              navigateToShowcase: () => model.navigateToShowcaseView(),
            ),
          ),
          BlockWrapper(Features()),
          Footer(
            navigateToShowcase: () => model.navigateToShowcaseView(),
            navigateToAbout: () => model.navigateToAboutView(),
            navigateToImprint: () => model.navigateToImprintView(),
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
                  navigateToShowcase: () => model.navigateToShowcaseView(),
                  navigateToAbout: () => model.navigateToAboutView(),
                  navigateToImprint: () => model.navigateToImprintView(),
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
                    verticalOffset: 150,
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
