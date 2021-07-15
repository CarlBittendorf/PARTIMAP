import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/components/spacing.dart';
import 'package:partimap/components/typography.dart';
import 'package:partimap/utils/texts.dart';
import 'package:partimap/utils/utils.dart';
import 'package:partimap/widgets/block_wrapper.dart';
import 'package:partimap/widgets/footer.dart';
import 'package:partimap/widgets/menu_bar.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';

import 'imprint_viewmodel.dart';

class ImprintView extends StatelessWidget {
  const ImprintView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImprintViewModel>.reactive(
      viewModelBuilder: () => ImprintViewModel(),
      builder: (
        BuildContext context,
        ImprintViewModel model,
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
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "HERAUSGEBER",
                            style: headlineSecondaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [HERAUSGEBER],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Inhalt des Onlineangebotes",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [INHALTE],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Verweise und Links",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [VERWEISE],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Urheber- und Kennzeichenrecht",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [URHEBERRECHT],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Datenschutzerklärung",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [DATENSCHUTZ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text:
                                "Rechtswirksamkeit dieses Haftungsausschlusses",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            RECHTSWIRKSAMKEIT,
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = openDisclaimer,
                              text: 'http://www.disclaimer.de',
                              style: bodyLinkTextStyle,
                            ),
                            TextSpan(text: '.'),
                          ],
                        ),
                      )
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
                            text: "IHRE BETROFFENENRECHTE",
                            style: headlineSecondaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            BETROFFENENRECHTE,
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = openDisclaimer,
                              text:
                                  'https://www.bfdi.bund.de/DE/Infothek/Anschriften_Links/anschriften_links-node.html',
                              style: bodyLinkTextStyle,
                            ),
                            TextSpan(text: '.'),
                          ],
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
                            text:
                                "ERFASSUNG ALLGEMEINER INFORMATIONEN BEIM BESUCH UNSERER WEBSITE",
                            style: headlineSecondaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Art und Zweck der Verarbeitung",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [ARTDERVERARBEITUNG],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Rechtsgrundlage",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [RECHTSGRUNDLAGE],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Empfänger",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [EMPFAENGER],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Speicherdauer",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [SPEICHERDAUER],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text:
                                "Bereitstellung vorgeschrieben oder erforderlich",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [BEREITSTELLUNG],
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
                            text: "ÄNDERUNG UNSERER DATENSCHUTZBESTIMMUNGEN",
                            style: headlineSecondaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [AENDERUNG],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: RichText(
                          text: TextSpan(
                            text: "Fragen an den Datenschutzbeauftragten",
                            style: headlineTertiaryTextStyle,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [FRAGEN],
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
                  navigateToHome: () => model.navigateToHomeView(),
                  navigateToShowcase: () => model.navigateToShowcaseView(),
                  navigateToAbout: () => model.navigateToAboutView(),
                  getStarted: () => model.showCreateDialog(),
                ),
              ),
              body: ListView.builder(
                itemCount: blocks.length,
                itemBuilder: (context, index) => blocks[index],
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
