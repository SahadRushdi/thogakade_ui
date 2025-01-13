import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/providers/inventory_provider.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inventoryProvider = Provider.of<InventoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search Inventory',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                inventoryProvider.searchItems(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: inventoryProvider.filteredItems.length,
              itemBuilder: (context, index) {
                final item = inventoryProvider.filteredItems[index];
                return Card(
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text(
                        'Price: \$${item['price']}/kg, Quantity: ${item['quantity']} kg'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showItemForm(context, inventoryProvider, item);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            inventoryProvider.deleteItem(item['id']);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _showItemForm(context, inventoryProvider);
        },
      ),
    );
  }

  void _showItemForm(BuildContext context, InventoryProvider provider,
      [Map<String, dynamic>? item]) {
    final nameController = TextEditingController(text: item?['name'] ?? '');
    final priceController =
    TextEditingController(text: item?['price']?.toString() ?? '');
    final quantityController =
    TextEditingController(text: item?['quantity']?.toString() ?? '');
    final categoryController =
    TextEditingController(text: item?['category'] ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(item == null ? 'Add Item' : 'Edit Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price per kg'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final newItem = {
                'name': nameController.text.trim(),
                'price': double.tryParse(priceController.text.trim()) ?? 0.0,
                'quantity': double.tryParse(quantityController.text.trim()) ?? 0.0,
                'category': categoryController.text.trim(),
              };

              if (item == null) {
                // Add new item
                await provider.addItem(newItem);
              } else {
                // Update existing item
                await provider.updateItem(item['id'], newItem);
              }

              Navigator.of(ctx).pop();
            },
            child: Text(item == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }
}
