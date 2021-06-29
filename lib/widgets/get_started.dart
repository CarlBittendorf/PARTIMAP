import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/components/spacing.dart';
import 'package:partimap/components/typography.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GetStarted extends StatelessWidget {
  final void Function()? callback;
  final void Function()? navigateToShowcase;
  const GetStarted({Key? key, this.callback, this.navigateToShowcase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Row(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: RichText(
                  text: TextSpan(
                    text:
                        "PARTIMAP is a free tool designed to seemlessly structure your ideas and arguments. No registration required.",
                    style: headlineSecondaryTextStyle,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: ResponsiveRowColumn(
                  layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveRowColumnItem(
                      child: TextButton(
                        onPressed: callback,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primary),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered))
                                return buttonPrimaryDark;
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed))
                                return buttonPrimaryDarkPressed;
                              return primary;
                            },
                          ),
                          shape:
                              MaterialStateProperty.resolveWith<OutlinedBorder>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed))
                                return RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)));
                              return RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)));
                            },
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      vertical: 32, horizontal: 84)),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return BorderSide(
                                  width: 3, color: buttonPrimaryPressedOutline);
                            return BorderSide(width: 3, color: Colors.white);
                          }),
                        ),
                        child: Text(
                          'Create',
                          style: buttonTextStyle.copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Or check out some ',
                        style: bodyTextStyle,
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = navigateToShowcase,
                        text: 'examples',
                        style: bodyLinkTextStyle,
                      ),
                      TextSpan(
                        text: '.',
                        style: bodyTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
