# flutter_oauth2_client

Flutter example for dart-lang/oauth2 package

Launch url to IdentityServer for Login

``` Dart
// Used to launch the url
import 'package:url_launcher/url_launcher.dart';

 signin() async {
    // Use this to decide which idp to use, Google or GitHub and so on
    // var parameters = {"acr_values": "idp:AzureAD"}; 
    // var idpUri = addQueryParameters(_uri, parameters);
    //var url =  idpUri.toString();
    
    var url = _uri.toString();
    
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
```

This is used for the callback to the app

``` Dart
final redirectUrl = Uri.parse("https://notused");
```

``` Dart
  initUrlListener() {
    getUriLinksStream().listen((Uri uri) async {
      var client = await grant.handleAuthorizationResponse(uri.queryParameters);
      setState(() {
        _client = client;
      });
    });
  }
```

``` Dart
import 'package:uni_links/uni_links.dart';
// Provides method for listening to url

getUriLinksStream().listen((Uri uri)
```

The url should be registered in [AndroidManifest.xml](android/app/src/main/AndroidManifest.xml) 

``` xml
 <!-- App Links -->
 <intent-filter android:autoVerify="true">
  <action android:name="android.intent.action.VIEW" />
  <category android:name="android.intent.category.DEFAULT" />
  <category android:name="android.intent.category.BROWSABLE" />
  <data android:scheme="https" android:host="notused" />
 </intent-filter>
</activity>
```

and [Info.plist](ios/Runner/Info.plist)

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
 <dict>		
  <key>CFBundleURLTypes</key>
   <array>
    <dict>
     <key>CFBundleTypeRole</key>
     <string>Editor</string>
     <key>CFBundleURLName</key>
     <string>com.example.flutter_client</string>
     <key>CFBundleURLSchemes</key>
     <array>
      <string>flutter_client</string>
      </array>
     </dict>
  </array>
 </dict>
</plist>
```

