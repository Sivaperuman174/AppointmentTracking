class Feedback {
  late int id;
  late int appointmentId;
  late String comments;
  String? image;
  late DateTime commentOn;
  DateTime? updateOn;
  late int deleted;

  Feedback(
      {required this.id,
      required this.appointmentId,
      required this.comments,
      this.image,
      required this.commentOn,
      this.updateOn,
      required this.deleted});

  Feedback.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointmentId'];
    comments = json['comments'];
    image = json['image'];
    commentOn = json['commentOn'];
    updateOn = json['updateOn'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appointmentId'] = appointmentId;
    data['comments'] = comments;
    data['image'] = image;
    data['commentOn'] = commentOn;
    data['updateOn'] = updateOn;
    data['deleted'] = deleted;
    return data;
  }
}
