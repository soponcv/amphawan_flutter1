class ListEvent {
  final String id;
  final String uploadKey;
  final String subject;
  final String location;
  final String description;
  final String date_start;
  final String date_end;
  final String create_date;
  final String display_image;

  ListEvent(
      {this.id,
      this.subject,
      this.uploadKey,
      this.location,
      this.description,
      this.date_start,
      this.date_end,
      this.create_date,
      this.display_image});

  factory ListEvent.fromJson(Map<String, dynamic> json) {
    return ListEvent(
      id: json['id'] as String,
      subject: json['subject'] as String,
      uploadKey: json['uploadKey'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      date_start: json['date_start'] as String,
      date_end: json['date_end'] as String,
      create_date: json['create_date'] as String,
      display_image: json['display_image'] as String,
    );
  }
}

class ListEventImg {
  final String file;

  ListEventImg({this.file});

  factory ListEventImg.fromJson(Map<String, dynamic> json) {
    return ListEventImg(
      file: json['file'] as String,
    );
  }
}
