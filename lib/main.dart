import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owe/owe/presentation/pages/home/home_navigation.dart';
import 'package:owe/owe/presentation/pages/trails/professionalizing/formation/formation_page.dart';

import 'owe/utils/color_theme.dart';

void main() {
  runApp(Owe());
}

class Owe extends StatefulWidget {
  @override
  _OweState createState() => _OweState();
}

class _OweState extends State<Owe> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        title: "Owe",
        theme: ThemeData(
          primaryColor: ColorThemeApp.primaryColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white),
          fontFamily: 'Baloo2',
          textTheme: TextTheme(
            headline:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            button: TextStyle(color: Colors.white),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: ColorThemeApp.secondColor,
            textTheme: ButtonTextTheme.normal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(8),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        routes: {},
        debugShowCheckedModeBanner: false,
        home: FormationPage());
  }
}
