class MerchandiseModel {
  final int id;
  final int scheduleCollectionId;
  final String nameGoods;
  final String idGoods;
  final String totalWeight;
  final String warehouse;
  final String processingOwner;

  MerchandiseModel({
    required this.scheduleCollectionId,
    required this.id,
    required this.nameGoods,
    required this.idGoods,
    required this.totalWeight,
    required this.warehouse,
    required this.processingOwner,
  });

  // convert Map to MerchandiseModel
  factory MerchandiseModel.fromMap(Map<String, dynamic> map) {
    return MerchandiseModel(
      id: map['id'] ?? 0,
      scheduleCollectionId: map['scheduleCollectionId'] ?? 0,
      nameGoods: map['nameGoods'],
      idGoods: map['idGoods'] ?? '',
      totalWeight: map['totalWeight'] ?? '',
      warehouse: map['warehouse'] ?? '',
      processingOwner: map['processingOwner'],
    );
  }

  // convert MerchandiseModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'scheduleCollectionId': scheduleCollectionId,
      'nameGoods': nameGoods,
      'idGoods': idGoods,
      'totalWeight': totalWeight,
      'warehouse': warehouse,
      'processingOwner': processingOwner,
    };
  }
}
