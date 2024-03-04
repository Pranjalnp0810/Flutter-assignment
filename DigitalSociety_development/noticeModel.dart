class NoticeModel {
  String? id;
  String? titleN;
  String? descriptN;
  String? dateN;

  NoticeModel(
      {required this.id,
      required this.titleN,
      required this.descriptN,
      required this.dateN});

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
        id: json['id'],
        titleN: json['titleN'],
        descriptN: json['descN'],
        dateN: json['dateN']);
  }
}
