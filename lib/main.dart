//      _____ _                           _____                     
//     / ____| |                         / ____|                    
//    | |    | |__  _ __ ___  _ __   ___| (___   ___ _ __  ___  ___ 
//    | |    | '_ \| '__/ _ \| '_ \ / _ \\___ \ / _ \ '_ \/ __|/ _ \
//    | |____| | | | | | (_) | | | | (_) |___) |  __/ | | \__ \  __/
//     \_____|_| |_|_|  \___/|_| |_|\___/_____/ \___|_| |_|___/\___|
//
//----------------------------------------------------------------------
//
//Coded by Yumithecat with <3 and cookies
//thanks to Felix for being the best boyfriend ever :]
//Felix if you ever see this, I love you sooo much
//
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_local_variable, no_leading_underscores_for_local_identifiers, deprecated_member_use, sort_child_properties_last, unnecessary_cast

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyMain());
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChronoSense',
      theme: customThemeData(), // Use the custom theme
      home: const MyMainPage(title: 'ChronoSense'),
    );
  }
}

//MATERIAL THEME DATA
ThemeData customThemeData() {
  Color primaryColor = Color(0xFF0EF6CC);
  Color accentColor = Color(0xFF3A4F50);
  Color backgroundColor = Color(0xFF1d0c1a);

  MaterialColor primarySwatch = MaterialColor(
    primaryColor.value,
    <int, Color>{
      50: primaryColor.withOpacity(0.1),
      100: primaryColor.withOpacity(0.2),
      200: primaryColor.withOpacity(0.3),
      300: primaryColor.withOpacity(0.4),
      400: primaryColor.withOpacity(0.5),
      500: primaryColor.withOpacity(0.6),
      600: primaryColor.withOpacity(0.7),
      700: primaryColor.withOpacity(0.8),
      800: primaryColor.withOpacity(0.9),
      900: primaryColor.withOpacity(1.0),
    },
  );

  return ThemeData(
    primarySwatch: primarySwatch,
    hintColor: accentColor,
    fontFamily: 'Quicksand', // Apply the Quicksand font
    scaffoldBackgroundColor: backgroundColor,
    // Add more customizations here if needed
    useMaterial3: true,
  );
}

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key, required this.title});
  final String title;
  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

Future<void> initializeWindow(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? skipIntro = prefs.getString('cs_introdone');


  WidgetsFlutterBinding.ensureInitialized();

}

class _MyMainPageState extends State<MyMainPage> {
  String? versionName;

  bool _showColumn =
      false; // Initialize to false, so the column is hidden on page load

  vibrate(){
    if (Theme.of(context).platform == TargetPlatform.android) {
      const _type = FeedbackType.selection;
      HapticFeedback.vibrate();
    }
  }

  @override
  void initState() {
    super.initState();

    // Set a delay to start the fade-in animation after 0.5 seconds
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _showColumn = true;
      });
    });

    initializeWindow(context);
    getData();
    setFlaunch();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    super.dispose();
  }

  Future<void> getData() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String versionName = packageInfo.buildNumber;

    setState(() {});
  }

  setFlaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cs_flaunch', "true");
  }

  @override
  Widget build(BuildContext context) {
    // Set the navigation bar color to the app's background color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
    ));

     return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
            20.0), // Replace '16.0' with your desired padding value
        child: Center(
          child: AnimatedOpacity(
            opacity: _showColumn ? 1.0 : 0.0, // Step 2: Set the initial opacity
            duration: Duration(
                milliseconds: 500), // Duration of the fade-in animation
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //TIMER ICON
                Image.asset('assets/images/logo.png'),
                SizedBox(height: 40),

                //TITLE TEXT
                Text(
                  'Track Your Yumi',
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(0xFFff0066),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),

                Text(
                  "Made with ❤️ by Yumi",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFA3798A),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),

                Text(
                  'Initiating server connection...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA3798A),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),

                
              ],
            ),
          ),
        ),
      ),
        );
  }
}
