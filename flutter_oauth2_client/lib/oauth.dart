import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:http/http.dart" as http;
import 'extract_token_info.dart';

final authorizationEndpoint =
    Uri.parse("https://github.com/login/oauth/authorize");
final tokenEndpoint = Uri.parse("https://github.com/login/oauth/access_token");
final identifier = "5ec07ff0c2bd56253be7";
final secret = "1987b0350eb8bdd65620a764d391713497c04a0d";
final redirectUrl = Uri.parse("https://notused");
final credentialsFile = new File("~/.myapp/credentials.json");
final _scopes = ['user'];

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  oauth2.AuthorizationCodeGrant grant;
  oauth2.Client _client;

  Uri _uri;

  @override
  void initState() {
    super.initState();
    grant = new oauth2.AuthorizationCodeGrant(
        identifier, authorizationEndpoint, tokenEndpoint,
        secret: secret);
    _uri = grant.getAuthorizationUrl(redirectUrl, scopes: _scopes);
    initUrlListener();
  }

  // This is used for the callback to the app
  // The url should be registered in AndroidManifest.xml and Info.plist
  initUrlListener() {
    getUriLinksStream().listen((Uri uri) async {
      uri = addQueryParameters(uri, {"Accept": "application/json"});

      final client =
          await grant.handleAuthorizationResponse(uri.queryParameters);

      setState(() {
        _client = client;
      });
    });
  }

  signin() async {
    var url = _uri.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(_client?.credentials?.accessToken ?? 'Not signed in yet'),
              ExtractTokenInfo(
                  token: _client?.credentials
                      ?.accessToken), // Uncomment to display name from claims
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: new Text("Sign in"),
                  onPressed: signin,
                ),
              )
            ],
          ),
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        ),
      ),
    );
  }
}

Uri addQueryParameters(Uri url, Map<String, String> parameters) => url.replace(
    queryParameters: Map.from(url.queryParameters)..addAll(parameters));
