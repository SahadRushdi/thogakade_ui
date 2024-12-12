import 'package:flutter/material.dart';
import '../widgets/summary_card.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            SummaryCard(title: 'Total Inventory', value: '60'),
            SummaryCard(title: 'Low Stock Alerts', value: '5'),
            SummaryCard(title: 'Today\'s Orders', value: '25'),
            SummaryCard(title: 'Revenue Overview', value: '\$1200'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightGreen[700]),
              child: const Text(
                'Thoga Kade',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'Dashboard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              title: const Text(
                'Inventory',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              onTap: () => Navigator.pushNamed(context, '/inventory'),
            ),
            ListTile(
              title: const Text(
                'Orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              onTap: () => Navigator.pushNamed(context, '/orders'),
            ),
            ListTile(
              title: const Text(
                'Reports',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              onTap: () => Navigator.pushNamed(context, '/reports'),
            ),
          ],
        ),
      ),
    );
  }
}
