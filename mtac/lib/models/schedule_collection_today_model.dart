class ScheduleCollectionTodayModel {
  final String status;
  final String collectionId;
  final String nameBusiness;
  final String addressColection;
  final String typeWaste;
  final String areaTransit;
  final String numberPlate;
  final String numberWorker;
  final String timeCollection;
  final String contactPerson;

  ScheduleCollectionTodayModel({
    required this.status,
    required this.collectionId,
    required this.nameBusiness,
    required this.addressColection,
    required this.typeWaste,
    required this.areaTransit,
    required this.numberPlate,
    required this.numberWorker,
    required this.timeCollection,
    required this.contactPerson,
  });

  // Convert Map to scheduleCollectionTodayModel
  factory ScheduleCollectionTodayModel.fromMap(Map<String, dynamic> map) {
    return ScheduleCollectionTodayModel(
        status: map['status'],
        collectionId: map['collectionId'],
        nameBusiness: map['nameBusiness'],
        addressColection: map['addressColection'],
        typeWaste: map['typeWaste'],
        areaTransit: map['areaTransit'],
        numberPlate: map['numberPlate'],
        numberWorker: map['numberWorker'],
        timeCollection: map['timeCollection'],
        contactPerson: map['contactPerson']);
  }

  // Convert scheduleCollectionTodayModel to Map
  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'collectionId': collectionId,
      'nameBusiness': nameBusiness,
      'addressColection': addressColection,
      'typeWaste': typeWaste,
      'areaTransit': areaTransit,
      'numberPlate': numberPlate,
      'numberWorker': numberWorker,
      'timeCollection': timeCollection,
      'contactPerson': contactPerson,
    };
  }
}
