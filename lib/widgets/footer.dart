import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/components/typography.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Footer extends StatelessWidget {
  final void Function()? navigateToHome;
  final void Function()? navigateToShowcase;
  final void Function()? navigateToAbout;

  const Footer(
      {Key? key,
      this.navigateToAbout,
      this.navigateToShowcase,
      this.navigateToHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundDark,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isMobile
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        columnMainAxisSize: MainAxisSize.min,
        children: [
          ResponsiveRowColumnItem(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Image.asset("assets/images/logo.png",
                  height: 100, fit: BoxFit.contain),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFit: FlexFit.loose,
            columnFit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: bodyTextStyle.copyWith(
                        fontSize: 14, color: Colors.white, height: 2),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = navigateToHome,
                        text: "Home",
                      ),
                      TextSpan(text: "  •  "),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = navigateToShowcase,
                        text: "Showcase",
                      ),
                      TextSpan(text: "  •  "),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = navigateToAbout,
                        text: "About",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
