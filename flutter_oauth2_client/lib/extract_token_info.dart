import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:flutter/material.dart';

class ExtractTokenInfo extends StatelessWidget {
  final String token;
  ExtractTokenInfo({this.token});

  @override
  Widget build(BuildContext context) {
    var displayname;
    if (this.token != null) {
      var decodedToken = new JWT.parse(this.token);
      displayname = decodedToken.getClaim('name');
    }
    return Center(
      child: Text(displayname ?? 'No claim name'),
    );
  }
}
