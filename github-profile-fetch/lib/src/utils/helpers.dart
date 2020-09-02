import 'package:flutter/material.dart';

/// Hex Color to convert the 16 bit to 32 bit color code
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

/// this function converts the map into queryparamsString
/// {key1: value1, key2: value2}
/// [return] => '?key1=value1&key2=value2'
String stringifyQueryParams(Map<String, dynamic> obj) {
  String queryString = '';

  obj.forEach((key, val) {
    /// if type of value is list
    /// then join all values by ',' and assign to value back
    if (val is List) {
      val = val.toList().join(',');
    }

    /// if value is empty then simple return
    if (val.toString().isEmpty) return;
    queryString += '$key=$val&';
  });

  return queryString.isNotEmpty
      ? '?${queryString.substring(0, (queryString.length - 1))}'
      : '';
}

/// this functions add queryparams to relativeUrl;
/// [relativeUrl] = 'https://domain.com?key1=value1&key2=value2'
/// [queryParams] = {xKey: String, yKey: List};
String addQueryParams(String relativeUrl, [Map<String, dynamic> queryParams]) {
  if (relativeUrl.isEmpty) {
    return '';
  }

  /// split the relative url from ?
  /// so that parse already appended queryparams;
  List splitUrl = relativeUrl.split('?');

  Map<String, dynamic> existingParams = {};

  if (splitUrl.length > 1) {
    /// returns map for the existing queryParam string
    /// key1=value1&key2&value is convert to
    /// {key1: value1, key2: value2}
    existingParams = Uri.splitQueryString(splitUrl[1]);
  }

  /// merging existing queryparams and new queryparams together
  existingParams = {...existingParams, ...queryParams};

  return '${splitUrl.first}${stringifyQueryParams(existingParams)}';
}
