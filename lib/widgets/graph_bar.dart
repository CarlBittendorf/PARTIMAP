import 'package:flutter/material.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/components/typography.dart';
import 'package:partimap/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GraphBar extends StatelessWidget {
  final String name;
  final void Function()? navigateToShowcase;
  final void Function()? navigateToAbout;
  final void Function()? addVertex;
  final void Function()? copyToClipboard;
  final void Function()? showInfo;

  const GraphBar(
      {Key? key,
      this.navigateToAbout,
      required this.name,
      this.copyToClipboard,
      this.addVertex,
      this.showInfo,
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
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
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
              onTap: addVertex,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.add, color: navLinkColor, size: 24),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: copyToClipboard,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.copy, color: navLinkColor, size: 24),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: showInfo,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.info_outlined, color: navLinkColor, size: 24),
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
        ],
      ),
    );
  }
}
