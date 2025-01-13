import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class InventoryProvider with ChangeNotifier {
  final DatabaseReference _databaseRef =
  FirebaseDatabase.instance.ref('inventory');

  List<Map<String, dynamic>> _items = [];
  List<Map<String, dynamic>> get items => _items;

  List<Map<String, dynamic>> _filteredItems = [];
  List<Map<String, dynamic>> get filteredItems =>
      _filteredItems.isEmpty ? _items : _filteredItems;

  InventoryProvider() {
    _fetchItems();
  }

  // Fetch data from Firebase and handle potential type issues
  void _fetchItems() {
    _databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        _items = data.entries.map((entry) {
          final key = entry.key;
          final value = entry.value as Map<dynamic, dynamic>;

          // Ensure all fields are properly cast and handle null values gracefully
          return {
            'id': key,
            'name': value['name'] ?? 'Unnamed', // Default to 'Unnamed' if null
            'category': value['category'] ?? 'Uncategorized', // Default if null
            'price': _toDouble(value['price']), // Handle int/double safely
            'quantity': _toInt(value['quantity']), // Convert to int safely
          };
        }).toList();
      } else {
        _items = [];
      }

      notifyListeners();
    });
  }

  // Utility method to safely convert to double
  double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    return double.tryParse(value.toString()) ?? 0.0; // Fallback to 0.0
  }

  // Utility method to safely convert to int
  int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    return int.tryParse(value.toString()) ?? 0; // Fallback to 0
  }

  // Add a new item to Firebase
  Future<void> addItem(Map<String, dynamic> item) async {
    try {
      await _databaseRef.push().set(item);
    } catch (e) {
      debugPrint('Error adding item: $e');
    }
  }

  // Update an existing item in Firebase
  Future<void> updateItem(String id, Map<String, dynamic> updatedItem) async {
    try {
      await _databaseRef.child(id).update(updatedItem);
    } catch (e) {
      debugPrint('Error updating item: $e');
    }
  }

  // Delete an item from Firebase
  Future<void> deleteItem(String id) async {
    try {
      await _databaseRef.child(id).remove();
    } catch (e) {
      debugPrint('Error deleting item: $e');
    }
  }

  // Search items by name or category
  void searchItems(String query) {
    if (query.isEmpty) {
      _filteredItems = [];
    } else {
      _filteredItems = _items
          .where((item) =>
      (item['name'] as String).toLowerCase().contains(query.toLowerCase()) ||
          (item['category'] as String).toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
