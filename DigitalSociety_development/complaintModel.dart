class ComplaintsModel {
  String? id;
  String? topicC;
  String? descriptC;

  ComplaintsModel(
      {required this.id, required this.topicC, required this.descriptC});

  factory ComplaintsModel.fromJson(Map<String, dynamic> json) {
    return ComplaintsModel(
        id: json['id'], topicC: json["topicC"], descriptC: json['descriptC']);
  }
}
