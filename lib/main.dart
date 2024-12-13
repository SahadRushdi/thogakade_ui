import 'package:flutter/material.dart';
import 'config/routes.dart';

void main() {
  runApp(ThogaKadeApp());
}

class ThogaKadeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thoga Kade',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.dashboard,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
