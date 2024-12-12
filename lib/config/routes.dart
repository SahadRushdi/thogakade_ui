import 'package:flutter/material.dart';
import 'package:thogakade_ui/presentations/screens/dashboard_screen.dart';
import 'package:thogakade_ui/presentations/screens/inventory_screen.dart';
import 'package:thogakade_ui/presentations/screens/orders_screen.dart';
import 'package:thogakade_ui/presentations/screens/report_screen.dart';


class AppRoutes {
  static const String dashboard = '/';
  static const String inventory = '/inventory';
  static const String orders = '/orders';
  static const String reports = '/reports';

  static Map<String, WidgetBuilder> get routes => {
    dashboard: (context) => DashboardScreen(),
    inventory: (context) => InventoryScreen(),
    orders: (context) => OrdersScreen(),
    reports: (context) => ReportsScreen(),
  };
}
