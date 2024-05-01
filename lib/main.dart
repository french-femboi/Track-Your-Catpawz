import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers_platform_interface/audioplayers_platform_interface.dart';
import 'package:audioplayers_web/audioplayers_web.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track Your Catpawz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF14101b)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Track Your Catpawz :3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String status = '';
  String energy = '';
  String social = '';
  bool isLocked = false;

  String get url => "https://ydy.dynapaw.eu/audio/meow.mp3";

  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  void _openOffline() async {
    const websiteUrl =
        'https://dynapaw.eu/server-offline'; // Replace with your website URL
    if (await canLaunchUrlString(websiteUrl)) {
      await launchUrlString(websiteUrl);
      print('I did launch $websiteUrl');
    } else {
      print('Could not launch $websiteUrl');
    }
  }

  _authenticate() async {
    try {
      // Replace 'YOUR_API_KEY' with your actual API key
      String apiKey = '1iXG6spD19qSXKJ00rRnt3aw3FaGtfEu';

      // Create the URL for your API call
      String url =
          'https://api.dynapaw.eu/api/database/rows/table/1091/?user_field_names=true';

      // Make the API call using http package
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Token $apiKey'},
      );

      if (response.statusCode == 200) {
        final dynamic json = jsonDecode(response.body);
        final List<dynamic> results = json['results'];

        if (results.isNotEmpty) {
          final result = results[0]; // Use the first result for demo purposes
          setState(() {
            status = result['status'];
            energy = result['energy'];
            social = result['socialstatus'];
          });
        }
      } else {
        print('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  void _openOne() async {
    const websiteUrl = 'https://catpawz.eu'; // Replace with your website URL
    if (await canLaunchUrlString(websiteUrl)) {
      await launchUrlString(websiteUrl);
      print('I did launch $websiteUrl');
    } else {
      print('Could not launch $websiteUrl');
    }
  }

  void _openTwo() async {
    const websiteUrl =
        'https://git.dynapaw.eu/fluffy_catpawz/TYY'; // Replace with your website URL
    if (await canLaunchUrlString(websiteUrl)) {
      await launchUrlString(websiteUrl);
      print('I did launch $websiteUrl');
    } else {
      print('Could not launch $websiteUrl');
    }
  }

    void _openThree() async {
    const websiteUrl =
        'https://status.catpawz.eu'; // Replace with your website URL
    if (await canLaunchUrlString(websiteUrl)) {
      await launchUrlString(websiteUrl);
      print('I did launch $websiteUrl');
    } else {
      print('Could not launch $websiteUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF110d17),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: 'quicksand',
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.home_rounded),
            onPressed: _openOne,
            tooltip: "Back to Catpawz",
            color: Color(0xFF110d17),
          ),
          IconButton(
            icon: Icon(Icons.code_rounded),
            onPressed: _openTwo,
            tooltip: "GIT",
            color: Color(0xFF110d17),
          ),
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            onPressed: _openThree,
            tooltip: "GIT",
            color: Color(0xFF110d17),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Wrap the Column in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hiya :3 On this page you'll be able to see my current status information... I think this pretty much explains itself doesn't it?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFE6DCF7),
                        fontFamily: 'quicksand',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "To refetch the status, please reload this page :')",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFE6DCF7),
                        fontFamily: 'quicksand',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Catpawz is currently...",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'quicksand',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "..." + status,
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 171, 145, 218),
                        fontFamily: 'quicksand',
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "..." + energy,
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 171, 145, 218),
                        fontFamily: 'quicksand',
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "..." + social,
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 171, 145, 218),
                        fontFamily: 'quicksand',
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Copyright © 2023-2024 Catpawz',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFE6DCF7),
                        fontFamily: 'quicksand',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
