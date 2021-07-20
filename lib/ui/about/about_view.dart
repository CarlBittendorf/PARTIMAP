import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/components/spacing.dart';
import 'package:partimap/components/typography.dart';
import 'package:partimap/utils/utils.dart';
import 'package:partimap/widgets/block_wrapper.dart';
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
          SizedBox(height: 32),
          BlockWrapper(
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: border)),
              margin: blockMargin,
              padding: EdgeInsets.all(40),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 780),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "About PARTIMAP",
                            style: headlineSecondaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  """PARTIMAP is a digital participation tool and a mind map in one. It enables brainstorming and collecting of ideas, solving problems and representation of all kinds of processes. Multiple users can work on the same map simultaneously. In addition to useful functions and easy handling, it offers the possibility of enabling and encouraging participation this way.

PARTIMAP can be used anonymously and without registration.

You can choose between private and public mode. Public maps are visible to all users via the showcase view. Every map can be accessed using its unique link.

The PARTIMAP project was created as part of the "Prototyping and Problem-Solving" course led by Franz Joseph Schmitt at the TU Berlin and MLU Halle-Wittenberg.""",
                            ),
                          ],
                          style: bodyTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BlockWrapper(
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: border)),
              margin: blockMargin,
              padding: EdgeInsets.all(40),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 780),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Technical Details",
                            style: headlineSecondaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'PARTIMAP was mostly written in ',
                              style: bodyTextStyle,
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = openDart,
                              text: 'Dart',
                              style: bodyLinkTextStyle,
                            ),
                            TextSpan(
                              text:
                                  ', a fast object-oriented language. Dart can not only be compiled to native code, but also transpiled to JavaScript to run in web browsers. For the database as well as hosting the website we use ',
                              style: bodyTextStyle,
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = openFirebase,
                              text: 'Firebase',
                              style: bodyLinkTextStyle,
                            ),
                            TextSpan(
                              text:
                                  ', which is part of Google Cloud Platform. The entire code is Open-Source and can be viewed on ',
                              style: bodyTextStyle,
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = openGitHub,
                              text: 'GitHub',
                              style: bodyLinkTextStyle,
                            ),
                            TextSpan(
                              text:
                                  '. If you think PARTIMAP is missing a feature, feel free to contribute.',
                              style: bodyTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Footer(
            navigateToHome: () => model.navigateToHomeView(),
            navigateToShowcase: () => model.navigateToShowcaseView(),
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
                  navigateToHome: () => model.navigateToHomeView(),
                  navigateToShowcase: () => model.navigateToShowcaseView(),
                  navigateToImprint: () => model.navigateToImprintView(),
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
