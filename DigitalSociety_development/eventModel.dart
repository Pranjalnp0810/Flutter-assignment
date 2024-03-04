class EventModel {
  String? id;
  String? titleE;
  String? descriptE;
  String? dateE;

  EventModel(
      {required this.id,
      required this.titleE,
      required this.descriptE,
      required this.dateE});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json['id'],
        titleE: json['titleE'],
        descriptE: json['descriptE'],
        dateE: json['dateE']);
  }
}
