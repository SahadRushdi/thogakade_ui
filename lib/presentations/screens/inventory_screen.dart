import 'package:flutter/material.dart';
import 'package:thogakade_ui/presentations/dialog/edit_inventory_dialog.dart';
import '../dialog/edit_inventory_dialog.dart';

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
            const TextField(
              decoration: InputDecoration(
                labelText: 'Search Inventory',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Placeholder count
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      title: Text('Vegetable ${index + 1}'),
                      subtitle: Text('Quantity: ${(index + 1) * 10} kg'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return EditInventoryDialog(
                                    itemName: 'Vegetable ${index + 1}',
                                    quantity: (index + 1) * 10,
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_shopping_cart, color: Colors.green),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Vegetable ${index + 1} added to cart'),
                                  duration: const Duration(seconds: 2),
                                  action: SnackBarAction(
                                    label: 'UNDO',
                                    onPressed: () {
                                      // Implement undo functionality here
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        const snackBar = SnackBar(content: Text('Tapped'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const EditInventoryDialog(
                      itemName: '',
                      quantity: 0,
                      isNewItem: true,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}