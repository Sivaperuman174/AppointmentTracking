import 'package:appointmenttrackerapp/model/client.dart';
import 'package:appointmenttrackerapp/model/employee.dart';
import 'package:appointmenttrackerapp/model/login.dart';

class Company {
  late int id;
  late String name;
  late String ownerName;
  late String address;
  late String mobileNo;
  late String contactPerson;
  late String location;
  late String deleted;
  List<Client>? clients;
  List<Employee>? employees;
  List<Login>? logins;

  Company(
      {required this.id,
      required this.name,
      required this.ownerName,
      required this.address,
      required this.mobileNo,
      required this.contactPerson,
      required this.location,
      required this.deleted,
      this.clients,
      this.employees,
      this.logins});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ownerName = json['ownerName'];
    address = json['address'];
    mobileNo = json['mobileNo'];
    contactPerson = json['contactPerson'];
    location = json['location'];
    deleted = json['deleted'];
    if (json['clients'] != null) {
      clients = <Client>[];
      json['clients'].forEach((v) {
        clients?.add(Client.fromJson(v));
      });
    }
    if (json['employees'] != null) {
      employees = <Employee>[];
      json['employees'].forEach((v) {
        employees?.add(Employee.fromJson(v));
      });
    }
    if (json['logins'] != null) {
      logins = <Login>[];
      json['logins'].forEach((v) {
        logins?.add(Login.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['ownerName'] = ownerName;
    data['address'] = address;
    data['mobileNo'] = mobileNo;
    data['contactPerson'] = contactPerson;
    data['location'] = location;
    data['deleted'] = deleted;
    if (clients != null) {
      data['clients'] = clients?.map((v) => v.toJson()).toList();
    }
    if (employees != null) {
      data['employees'] = employees?.map((v) => v.toJson()).toList();
    }
    if (logins != null) {
      data['logins'] = logins?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
