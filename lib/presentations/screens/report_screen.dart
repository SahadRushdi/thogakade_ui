import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Reports',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Daily Sales'),
                trailing: const Icon(Icons.bar_chart),
                onTap: () {
                  // Show detailed sales chart (to be implemented)
                },
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Stock Levels'),
                trailing: const Icon(Icons.pie_chart),
                onTap: () {
                  // Show stock levels chart (to be implemented)
                },
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Revenue Overview'),
                trailing: const Icon(Icons.show_chart),
                onTap: () {
                  // Show revenue chart (to be implemented)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
