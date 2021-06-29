import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/widgets/footer.dart';
import 'package:partimap/widgets/menu_bar.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';

import 'about_viewmodel.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (
        BuildContext context,
        AboutViewModel model,
        Widget? child,
      ) {
        var blocks = <Widget>[
          SizedBox(height: 300),
          Center(
            child: Text(
              'AboutView, work in progress',
            ),
          ),
          SizedBox(height: 300),
          Footer(
            navigateToHome: () => model.navigateToHomeView(),
            navigateToShowcase: () => model.navigateToShowcaseView(),
          ),
        ];
        return ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(
            context,
            Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, 66),
                child: MenuBar(
                  navigateToShowcase: () => model.navigateToShowcaseView(),
                  getStarted: () => model.showCreateDialog(),
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
