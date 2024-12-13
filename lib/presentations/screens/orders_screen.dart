import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Order Management',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // Placeholder count
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Order #${index + 1}'),
                subtitle: Text('Total: \$${(index + 1) * 20}'),
                trailing: const Text('Status: Pending'),
                onTap: () {
                  // Navigate to Order Details (to be implemented)
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to Create Order Form (to be implemented)
        },
      ),
    );
  }
}
