import 'package:flutter/material.dart';
import 'bottom_navigation .dart';
import 'list_view.dart';
import 'app_bar.dart';
import 'Map.dart';
import 'theme.dart';

class MainPanel extends StatefulWidget {
  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list_view(),
      bottomNavigationBar: bottom_navigation(),
      appBar: app_bar(context),
    );
  }
}





