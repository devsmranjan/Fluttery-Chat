import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'chat.dart';

const String appName = "Fluttery Chat";

final ThemeData iOSTheme = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Colors.white,
    primaryColorBrightness: Brightness.dark
);

final ThemeData androidTheme =
    ThemeData(primarySwatch: Colors.blue, accentColor: Colors.green);

const String defaultUserName = "Smruti Ranjan";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme:
          defaultTargetPlatform == TargetPlatform.iOS ? iOSTheme : androidTheme,
      home: ChatHome(),
    );
  }
}



