import 'package:flutter/material.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/components/typography.dart';
import 'package:partimap/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MenuBar extends StatelessWidget {
  final void Function()? getStarted;
  final void Function()? navigateToShowcase;
  final void Function()? navigateToAbout;

  const MenuBar(
      {Key? key,
      this.getStarted,
      this.navigateToAbout,
      this.navigateToShowcase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color navLinkColor = Color(0xFF6E7274);
    return Container(
      height: 66,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0x1A000000), offset: Offset(0, 2), blurRadius: 4)
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.menu, color: textPrimary, size: 28)),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 16, 5),
                child: Image.asset("assets/images/logo.png",
                    height: 37, fit: BoxFit.contain),
              ),
            ),
          ),
          Spacer(),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: navigateToShowcase,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Showcase",
                    style: TextStyle(
                        fontSize: 16,
                        color: navLinkColor,
                        fontFamily: fontFamily),
                  ),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: navigateToAbout,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "About",
                    style: TextStyle(
                        fontSize: 16,
                        color: navLinkColor,
                        fontFamily: fontFamily),
                  ),
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl('https://github.com/CarlBittendorf'),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(
                    AssetImage("assets/images/icon_github_64x.png"),
                    color: navLinkColor,
                    size: 24),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: [Condition.largerThan(name: MOBILE)],
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 0),
              child: TextButton(
                onPressed: getStarted,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(primary),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return buttonPrimaryDark;
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return buttonPrimaryDarkPressed;
                      return primary;
                    },
                  ),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)));
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)));
                    },
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 22, horizontal: 28)),
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
                  "Create",
                  style: buttonTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
