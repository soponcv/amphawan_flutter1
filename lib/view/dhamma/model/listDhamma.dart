class ListDhammaMain {
  final String id;
  final String cid;
  final String subject;
  final String num_person;
  final String date_start;
  final String date_end;

  ListDhammaMain(
      {this.id,
      this.cid,
      this.subject,
      this.num_person,
      this.date_start,
      this.date_end});

  factory ListDhammaMain.fromJson(Map<String, dynamic> json) {
    return ListDhammaMain(
      id: json['id'] as String,
      cid: json['cid'] as String,
      subject: json['subject'] as String,
      num_person: json['num_person'] as String,
      date_start: json['date_start'] as String,
      date_end: json['date_end'] as String,
    );
  }
}

class ListDhamma1 {
  final String id;
  final String cid;
  final String subject;
  final String num_person;
  final String date_start;
  final String date_end;

  ListDhamma1(
      {this.id,
      this.cid,
      this.subject,
      this.num_person,
      this.date_start,
      this.date_end});

  factory ListDhamma1.fromJson(Map<String, dynamic> json) {
    return ListDhamma1(
      id: json['id'] as String,
      cid: json['cid'] as String,
      subject: json['subject'] as String,
      num_person: json['num_person'] as String,
      date_start: json['date_start'] as String,
      date_end: json['date_end'] as String,
    );
  }
}

class ListDhamma2 {
  final String id;
  final String cid;
  final String subject;
  final String num_person;
  final String date_start;
  final String date_end;

  ListDhamma2(
      {this.id,
      this.cid,
      this.subject,
      this.num_person,
      this.date_start,
      this.date_end});

  factory ListDhamma2.fromJson(Map<String, dynamic> json) {
    return ListDhamma2(
      id: json['id'] as String,
      cid: json['cid'] as String,
      subject: json['subject'] as String,
      num_person: json['num_person'] as String,
      date_start: json['date_start'] as String,
      date_end: json['date_end'] as String,
    );
  }
}

class ListDhamma3 {
  final String id;
  final String cid;
  final String subject;
  final String num_person;
  final String date_start;
  final String date_end;

  ListDhamma3(
      {this.id,
      this.cid,
      this.subject,
      this.num_person,
      this.date_start,
      this.date_end});

  factory ListDhamma3.fromJson(Map<String, dynamic> json) {
    return ListDhamma3(
      id: json['id'] as String,
      cid: json['cid'] as String,
      subject: json['subject'] as String,
      num_person: json['num_person'] as String,
      date_start: json['date_start'] as String,
      date_end: json['date_end'] as String,
    );
  }
}
