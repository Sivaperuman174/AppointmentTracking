import 'feedback.dart';

class Appointment {
  late int id;
  late int clientId;
  late int requestId;
  late int createdBy;
  late int allocatedTo;
  late int alternateAllocateTo;
  late String description;
  late DateTime bookedOn;
  late DateTime actualDate;
  late DateTime alternateDate;
  String? acceptanceStatus;
  late String status;
  late int deleted;
  List<Feedback>? feedbacks;

  Appointment(
      {required this.id,
      required this.clientId,
      required this.requestId,
      required this.createdBy,
      required this.allocatedTo,
      required this.alternateAllocateTo,
      required this.description,
      required this.bookedOn,
      required this.actualDate,
      required this.alternateDate,
      this.acceptanceStatus,
      required this.status,
      required this.deleted,
      this.feedbacks});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    requestId = json['requestId'];
    createdBy = json['createdBy'];
    allocatedTo = json['allocatedTo'];
    alternateAllocateTo = json['alternateAllocateTo'];
    description = json['description'];
    bookedOn = json['bookedOn'];
    actualDate = json['actualDate'];
    alternateDate = json['alternateDate'];
    acceptanceStatus = json['acceptanceStatus'];
    status = json['status'];
    deleted = json['deleted'];
    if (json['feedbacks'] != null) {
      feedbacks = <Feedback>[];
      json['feedbacks'].forEach((v) {
        feedbacks?.add(Feedback.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clientId'] = clientId;
    data['requestId'] = requestId;
    data['createdBy'] = createdBy;
    data['allocatedTo'] = allocatedTo;
    data['alternateAllocateTo'] = alternateAllocateTo;
    data['description'] = description;
    data['bookedOn'] = bookedOn;
    data['actualDate'] = actualDate;
    data['alternateDate'] = alternateDate;
    data['acceptanceStatus'] = acceptanceStatus;
    data['status'] = status;
    data['deleted'] = deleted;
    if (feedbacks != null) {
      data['feedbacks'] = feedbacks?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
