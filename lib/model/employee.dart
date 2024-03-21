class Employee {
  late int id;
  late int companyId;
  late String name;
  late String qualification;
  late DateTime dateOfBirth;
  late String emailId;
  late int roleId;
  late String address;
  late String contactNo;
  late DateTime dateOfJoin;
  DateTime? dateOfReleave;
  late int deleted;

  Employee(
      {required this.id,
      required this.companyId,
      required this.name,
      required this.qualification,
      required this.dateOfBirth,
      required this.emailId,
      required this.roleId,
      required this.address,
      required this.contactNo,
      required this.dateOfJoin,
      this.dateOfReleave,
      required this.deleted});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    name = json['name'];
    qualification = json['qualification'];
    dateOfBirth = json['dateOfBirth'];
    address = json['emailId'];
    roleId = json['roleId'];
    address = json['address'];
    contactNo = json['contactNo'];
    dateOfJoin = json['dateOfJoin'];
    dateOfReleave = json['dateOfReleave'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['companyId'] = companyId;
    data['name'] = name;
    data['qualification'] = qualification;
    data['dateOfBirth'] = dateOfBirth;
    data['emailId'] = emailId;
    data['roleId'] = roleId;
    data['address'] = address;
    data['contactNo'] = contactNo;
    data['dateOfJoin'] = dateOfJoin;
    data['dateOfReleave'] = dateOfReleave;
    data['deleted'] = deleted;

    return data;
  }
}
