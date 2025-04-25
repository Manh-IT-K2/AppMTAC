class CostModel {
  final int? id;
  final int scheduleCollectionId;
  final String category;
  final String cost;
  final String quantity;
  final String totalMoney;
  final String note;
  final String status;

  CostModel({
    this.id,
    required this.scheduleCollectionId,
    required this.category,
    required this.cost,
    required this.quantity,
    required this.totalMoney,
    required this.note,
    required this.status,
  });

  // convert Map to CostModel
  factory CostModel.fromMap(Map<String, dynamic> map) {
    return CostModel(
        id: map['id'] ?? 0,
        scheduleCollectionId: map['schedule_collection_id'] ?? 0,
        category: map['category'],
        cost: map['cost'] ?? '',
        quantity: map['quantity'] ?? '',
        totalMoney: map['total_money'] ?? '',
        note: map['note'],
        status: map['status'] ?? ' ');
  }

  // convert CostModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'schedule_collection_id': scheduleCollectionId,
      'category': category,
      'cost': cost,
      'quantity': quantity,
      'total_money': totalMoney,
      'note': note,
      'status': status,
    };
  }
}
