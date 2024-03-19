class Request {
  late int id;
  late int clientId;
  late String requestType;
  late String description;
  late DateTime requestedOn;
  late String status;
  DateTime? completedOn;
  late int deleted;

  Request(
      {required this.id,
      required this.clientId,
      required this.requestType,
      required this.description,
      required this.requestedOn,
      required this.status,
      this.completedOn,
      required this.deleted});

  Request.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    requestType = json['requestType'];
    description = json['description'];
    requestedOn = json['requestedOn'];
    status = json['status'];
    completedOn = json['completedOn'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clientId'] = clientId;
    data['requestType'] = requestType;
    data['description'] = description;
    data['requestedOn'] = requestedOn;
    data['status'] = status;
    data['completedOn'] = completedOn;
    data['deleted'] = deleted;
    return data;
  }
}
