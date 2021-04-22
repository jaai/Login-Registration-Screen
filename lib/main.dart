import 'package:flutter/material.dart';
import 'package:flutter_starter_app/screens/dashboard_screen.dart';
import 'package:flutter_starter_app/screens/login_page.dart';
import 'package:flutter_starter_app/screens/news_screen.dart';
import 'package:flutter_starter_app/screens/tab_dashboard_screen.dart';

void main() => runApp(FlutterStarterDemo());

class FlutterStarterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: login_page(),
    );
  }
}
