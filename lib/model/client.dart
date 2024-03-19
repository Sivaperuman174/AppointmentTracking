import 'package:appointmenttrackerapp/model/appointment.dart';
import 'package:appointmenttrackerapp/model/request.dart';

class Client {
  late int id;
  late String name;
  late int companyId;
  late String address;
  late String primaryContactName;
  late String primaryContactNo;
  late String secondaryContactName;
  late String secondaryContactNo;
  late String location;
  late int deleted;
  List<Appointment>? appointments;
  List<Request>? requests;

  Client(
      {required this.id,
      required this.name,
      required this.companyId,
      required this.address,
      required this.primaryContactName,
      required this.primaryContactNo,
      required this.secondaryContactName,
      required this.secondaryContactNo,
      required this.location,
      required this.deleted,
      this.appointments,
      this.requests});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    companyId = json['companyId'];
    address = json['address'];
    primaryContactName = json['primaryContactName'];
    primaryContactNo = json['primaryContactNo'];
    secondaryContactName = json['secondaryContactName'];
    secondaryContactNo = json['secondaryContactNo'];
    location = json['location'];
    deleted = json['deleted'];
    if (json['appointments'] != null) {
      appointments = <Appointment>[];
      json['appointments'].forEach((v) {
        appointments?.add(Appointment.fromJson(v));
      });
    }
    if (json['requests'] != null) {
      requests = <Request>[];
      json['requests'].forEach((v) {
        requests?.add(Request.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['companyId'] = companyId;
    data['address'] = address;
    data['primaryContactName'] = primaryContactName;
    data['primaryContactNo'] = primaryContactNo;
    data['secondaryContactName'] = secondaryContactName;
    data['secondaryContactNo'] = secondaryContactNo;
    data['location'] = location;
    data['deleted'] = deleted;
    if (appointments != null) {
      data['appointments'] = appointments?.map((v) => v.toJson()).toList();
    }
    if (requests != null) {
      data['requests'] = requests?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
