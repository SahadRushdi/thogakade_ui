import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inventory Management',
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Search Inventory',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Placeholder count
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Vegetable ${index + 1}'),
                      subtitle: Text('Quantity: ${(index + 1) * 10} kg'),
                      trailing: Icon(Icons.edit),
                      onTap: () {
                        // Navigate to Edit Form (to be implemented)
                      },
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                // Navigate to Add Form (to be implemented)
              },
            ),
          ],
        ),
      ),
    );
  }
}
