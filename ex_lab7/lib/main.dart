import 'package:flutter/material.dart';
import './app_screen/list_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Basic List View Demo',
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Widget Exercise"),
      ),
      body: const List_view(),
    ),
  ));
}
