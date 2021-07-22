import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/components/spacing.dart';
import 'package:partimap/components/typography.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: border),
      ),
      margin: blockMargin,
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisSize: MainAxisSize.min,
        rowPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 80),
        columnPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        columnSpacing: 50,
        rowSpacing: 50,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  childAnimationBuilder: (widget) => SlideAnimation(
                    delay: Duration(milliseconds: 150),
                    duration: const Duration(milliseconds: 600),
                    verticalOffset: 100,
                    child: widget,
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Icon(
                        Icons.check,
                        size: 40.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Free and Open-Source",
                        style: headlineSecondaryTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "No paywalls, no advertisement, no cookies: PARTIMAP is completely free to use and its source code is publicly available.",
                      style: bodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  childAnimationBuilder: (widget) => SlideAnimation(
                    delay: Duration(milliseconds: 150),
                    duration: const Duration(milliseconds: 600),
                    verticalOffset: 100,
                    child: widget,
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Icon(
                        Icons.fingerprint,
                        size: 40.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Easy customization",
                        style: headlineSecondaryTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "We provide many options to adjust vertices including title, description, color, icon and comments.",
                      style: bodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  childAnimationBuilder: (widget) => SlideAnimation(
                    delay: Duration(milliseconds: 150),
                    duration: const Duration(milliseconds: 600),
                    verticalOffset: 100,
                    child: widget,
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Icon(
                        Icons.share,
                        size: 40.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Collaborate with others",
                        style: headlineSecondaryTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "Just share the link of your PARTIMAP and your colleagues can view and edit the same document. Changes are shown in real time.",
                      style: bodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
