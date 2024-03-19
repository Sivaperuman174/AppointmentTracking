class Login {
  late int id;
  late int companyId;
  int? employeeId;
  int? clientId;
  late String userName;
  late String password;
  late int deleted;

  Login(
      {required this.id,
      required this.companyId,
      this.employeeId,
      this.clientId,
      required this.userName,
      required this.password,
      required this.deleted});

  Login.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    employeeId = json['employeeId'];
    clientId = json['clientId'];
    userName = json['userName'];
    password = json['password'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['companyId'] = companyId;
    data['employeeId'] = employeeId;
    data['clientId'] = clientId;
    data['userName'] = userName;
    data['password'] = password;
    data['deleted'] = deleted;
    return data;
  }
}
