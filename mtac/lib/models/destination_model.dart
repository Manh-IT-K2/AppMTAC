class DestinationModel {
  final String addressBusiness;
  final String status;
  final String totalWeight;
  final String numberTake;
  final String note;

  DestinationModel({
    required this.addressBusiness,
    required this.status,
    required this.totalWeight,
    required this.numberTake,
    required this.note,
  });

  // convert Map to DestinationModel
  factory DestinationModel.fromMap(Map<String, dynamic> map) {
    return DestinationModel(
        addressBusiness: map['addressBusiness'] ?? '',
        status: map['status'] ?? '',
        totalWeight: map['totalWeight'] ?? '',
        numberTake: map['numberTake'] ?? '',
        note: map['note'] ?? ' ');
  }

  // convert DestinationModel to Map
  Map<String, dynamic> toMap() {
    return {
      'addressBusiness': addressBusiness,
      'status': status,
      'totalWeight': totalWeight,
      'numberTake': numberTake,
      'note': note,
    };
  }
}
