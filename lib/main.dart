import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('vi', 'VN'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter demo app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate("hello"),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          Text(
            AppLocalizations.of(context).translate("welcome"),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
