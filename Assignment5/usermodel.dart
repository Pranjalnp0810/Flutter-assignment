class UserModel {
  int? id;
  String? name;
  String? descript;
  String? date;
  String? priority;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping["id"] = id ?? null;
    mapping["name"] = name;
    mapping["descript"] = descript;
    mapping["date"] = date;
    mapping["priority"] = priority;

    return mapping;
  }
}
