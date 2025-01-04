class InventoryItem {
  final String id; // Firebase key or unique identifier
  final String name;
  final double pricePerKg;
  final int quantity;
  final String category; // Item category (e.g., vegetables, fruits)

  InventoryItem({
    required this.id,
    required this.name,
    required this.pricePerKg,
    required this.quantity,
    required this.category,
  });

  // Convert InventoryItem to Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pricePerKg': pricePerKg,
      'quantity': quantity,
      'category': category,
    };
  }

  // Create InventoryItem from Firebase data (Map)
  factory InventoryItem.fromMap(String id, Map<dynamic, dynamic> data) {
    return InventoryItem(
      id: id,
      name: data['name'],
      pricePerKg: data['pricePerKg'],
      quantity: data['quantity'],
      category: data['category'],
    );
  }
}
