import 'package:flutter/material.dart';
import 'config/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'state/providers/inventory_provider.dart'; // Import your InventoryProvider

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InventoryProvider()), // Add InventoryProvider
      ],
      child: ThogaKadeApp(),
    ),
  );
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
