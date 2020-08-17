import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  static double Function(double xA) interpolate(
      {List<double> xInterval, List<double> yInterval}) {
    double x0 = xInterval[0];
    double x1 = xInterval[1];

    double y0 = yInterval[0];
    double y1 = yInterval[1];

    double getValueOfInterpolatioAt(double xA) {
      if (xA > x1) {
        xA = x1;
      } else if (xA < x0) {
        xA = x0;
      }

      double yA = y0 + (y1 - y0) * ((xA - x0) / (x1 - x0));

      return yA;
    }

    return getValueOfInterpolatioAt;
  }
}
