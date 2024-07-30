// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unused_import, unused_element, avoid_print

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers_platform_interface/audioplayers_platform_interface.dart';
import 'package:audioplayers_web/audioplayers_web.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:js' as js;
import 'dart:html' as html;

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
  String message = '';
  String sstatus = '';
  String volumes = '';
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
            message = result['message'];
            sstatus = result['sstatus'];
            volumes = result['music'];
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
        'https://code.cloud.catpawz.eu/catpawz-group/websites/track-your-catpawz'; // Replace with your website URL
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

  reloadWindow() {
    html.window.location.reload();
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
            tooltip: "Source code",
            color: Color(0xFF110d17),
          ),
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            onPressed: reloadWindow,
            tooltip: "Reload",
            color: Color(0xFF110d17),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Wrap the Column in a SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Catpawz current status",
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
                      "Hiya :3 On this page you'll be able to see my current status information... I think this pretty much explains itself doesn't it? It's possible that this is a tiny bit delayed as my servers are kinda slow sometimes :<",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFE6DCF7),
                        fontFamily: 'quicksand',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Color.fromARGB(255, 46, 39, 58),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(2.0),
                        bottomRight: Radius.circular(2.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.code_rounded,
                            color: Color(0xFFAE7DEE),
                          ),
                          title: Text(
                            "Status - $sstatus",
                            style: TextStyle(
                                color: Color(
                                    0xFFAE7DEE)), // Set the desired title color here
                          ),
                          subtitle: Text(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 214, 203, 228)),
                              status),
                        ),
                      ],
                    ),
                  ),

                  Card(
                    color: Color.fromARGB(255, 46, 39, 58),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(2.0),
                        bottomRight: Radius.circular(2.0),
                        topLeft: Radius.circular(2.0),
                        topRight: Radius.circular(2.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.bolt_rounded,
                            color: Color(0xFFAE7DEE),
                          ),
                          title: Text(
                            "Energy level",
                            style: TextStyle(
                                color: Color(
                                    0xFFAE7DEE)), // Set the desired title color here
                          ),
                          subtitle: Text(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 214, 203, 228)),
                              energy),
                        ),
                      ],
                    ),
                  ),

                  Card(
                    color: Color.fromARGB(255, 46, 39, 58),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(2.0),
                        bottomRight: Radius.circular(2.0),
                        topLeft: Radius.circular(2.0),
                        topRight: Radius.circular(2.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.monitor_heart_rounded,
                            color: Color(0xFFAE7DEE),
                          ),
                          title: Text(
                            "Social anxiety status",
                            style: TextStyle(
                                color: Color(
                                    0xFFAE7DEE)), // Set the desired title color here
                          ),
                          subtitle: Text(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 214, 203, 228)),
                              social),
                        ),
                      ],
                    ),
                  ),

                  Card(
                    color: Color.fromARGB(255, 46, 39, 58),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(2.0),
                        bottomRight: Radius.circular(2.0),
                        topLeft: Radius.circular(2.0),
                        topRight: Radius.circular(2.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.volume_up_rounded,
                            color: Color(0xFFAE7DEE),
                          ),
                          title: Text(
                            "Volume status",
                            style: TextStyle(
                                color: Color(
                                    0xFFAE7DEE)), // Set the desired title color here
                          ),
                          subtitle: Text(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 214, 203, 228)),
                              volumes),
                        ),
                      ],
                    ),
                  ),

                  Card(
                    color: Color.fromARGB(255, 46, 39, 58),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(2.0),
                        topRight: Radius.circular(2.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.message_rounded,
                            color: Color(0xFFAE7DEE),
                          ),
                          title: Text(
                            "Custom message",
                            style: TextStyle(
                                color: Color(
                                    0xFFAE7DEE)), // Set the desired title color here
                          ),
                          subtitle: Text(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 214, 203, 228)),
                              message),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: (){
                        reloadWindow();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(
                            255, 34, 27, 46), // Change background color here
                      ),
                      child: Text(
                        "Refresh status data now...",
                        style: TextStyle(
                          color: Color.fromARGB(255, 171, 145, 218),
                          fontFamily: 'quicksand',
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '©2024 Catpawz | Made with <3 and cats by Catpawz',
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
