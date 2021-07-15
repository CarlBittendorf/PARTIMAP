import 'package:url_launcher/url_launcher.dart';

Future openUrl(String url, {bool newWindow = false}) async {
  if (await canLaunch(url)) {
    return await launch(
      url,
    );
  } else {
    print("Could not launch $url");
    return false;
  }
}

void openDisclaimer() async {
  openUrl('http://www.disclaimer.de');
}

void openBFDI() async {
  openUrl(
      'https://www.bfdi.bund.de/DE/Infothek/Anschriften_Links/anschriften_links-node.html');
}
