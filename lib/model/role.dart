class Role {
  late int id;
  late String name;
  late int deleted;

  Role({required this.id, required this.name, required this.deleted});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['deleted'] = deleted;
    return data;
  }
}
