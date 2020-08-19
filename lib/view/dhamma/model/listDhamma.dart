class ListDhamma {
  String id;
  String cid;
  String subject;

  ListDhamma(String id, String cid, String subject) {
    this.id = id;
    this.cid = cid;
    this.subject = subject;
  }

  ListDhamma.fromJson(Map json)
      : id = json['id'],
        cid = json['cid'],
        subject = json['subject'];

  Map toJson() {
    return {'id': id, 'cid': cid, 'subject': subject};
  }
}
