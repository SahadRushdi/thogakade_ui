import 'package:flutter/material.dart';
import '../widgets/summary_card.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            SummaryCard(title: 'Total Inventory', value: '120'),
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
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'Thoga Kade',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              title: Text('Inventory'),
              onTap: () => Navigator.pushNamed(context, '/inventory'),
            ),
            ListTile(
              title: Text('Orders'),
              onTap: () => Navigator.pushNamed(context, '/orders'),
            ),
            ListTile(
              title: Text('Reports'),
              onTap: () => Navigator.pushNamed(context, '/reports'),
            ),
          ],
        ),
      ),
    );
  }
}
