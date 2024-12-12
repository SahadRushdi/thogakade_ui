import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Daily Sales'),
                trailing: Icon(Icons.bar_chart),
                onTap: () {
                  // Show detailed sales chart (to be implemented)
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Stock Levels'),
                trailing: Icon(Icons.pie_chart),
                onTap: () {
                  // Show stock levels chart (to be implemented)
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Revenue Overview'),
                trailing: Icon(Icons.show_chart),
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
