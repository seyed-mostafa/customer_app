import 'package:flutter/material.dart';
import 'bottom_navigation .dart';
import 'list_view.dart';
import 'app_bar.dart';

class MainPanel extends StatefulWidget {
  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: list_view(),
      bottomNavigationBar: bottom_navigation(),
    );
  }
}
