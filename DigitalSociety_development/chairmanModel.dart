class ChairmanModel {
  int? id;
  String? nameC;
  String? emailC;
  String? passwordC;

  ChairmanModel(
      {required this.id,
      required this.nameC,
      required this.emailC,
      required this.passwordC});

  factory ChairmanModel.fromJson(Map<String, dynamic> json) {
    return ChairmanModel(
        id: json['id'],
        nameC: json['nameC'],
        emailC: json['emailC'],
        passwordC: json['passwordC']);
  }
}
