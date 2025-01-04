import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/inventory_item.dart';

class InventoryProvider with ChangeNotifier {
  final DatabaseReference _databaseRef =
  FirebaseDatabase.instance.ref('inventory');

  List<InventoryItem> _items = [];
  List<InventoryItem> get items => _items;

  List<InventoryItem> _filteredItems = [];
  List<InventoryItem> get filteredItems =>
      _filteredItems.isEmpty ? _items : _filteredItems;

  InventoryProvider() {
    _fetchItems();
  }

  // Get data from Firebase
  void _fetchItems() {
    _databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        _items = data.entries.map((entry) {
          final value = entry.value as Map<dynamic, dynamic>;
          return InventoryItem.fromMap(entry.key, value);
        }).toList();
      } else {
        _items = [];
      }

      notifyListeners();
    });
  }

  // Add a new data to Firebase
  Future<void> addItem(InventoryItem item) async {
    await _databaseRef.push().set(item.toMap());
  }

  // Update an existing data in Firebase
  Future<void> updateItem(String id, InventoryItem updatedItem) async {
    await _databaseRef.child(id).update(updatedItem.toMap());
  }

  // Delete an data from Firebase
  Future<void> deleteItem(String id) async {
    await _databaseRef.child(id).remove();
  }

  // Search data by name or category
  void searchItems(String query) {
    if (query.isEmpty) {
      _filteredItems = [];
    } else {
      _filteredItems = _items
          .where((item) =>
      item.name.toLowerCase().contains(query.toLowerCase()) ||
          item.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
