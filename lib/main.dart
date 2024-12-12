import 'package:flutter/material.dart';
import 'config/routes.dart';
import 'config/theme.dart';

void main() {
  runApp(ThogaKadeApp());
}

class ThogaKadeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thoga Kade',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.dashboard,
      routes: AppRoutes.routes,
    );
  }
}
