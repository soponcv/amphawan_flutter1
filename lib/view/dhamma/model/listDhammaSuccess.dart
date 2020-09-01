class ListDhammaSuccess {
  final String id;
  final int cid;
  final String dhamma_id;
  final String subject;
  final String cate_name;
  final String date_start;
  final String date_end;
  final String name;
  final String lastname;
  final int order;
  final String create_date;

  ListDhammaSuccess(
      {this.id,
      this.cid,
      this.dhamma_id,
      this.subject,
      this.cate_name,
      this.date_start,
      this.date_end,
      this.name,
      this.lastname,
      this.order,
      this.create_date});

  factory ListDhammaSuccess.fromJson(Map<String, dynamic> json) {
    return ListDhammaSuccess(
      id: json['id'] as String,
      cid: json['cid'] as int,
      dhamma_id: json['dhamma_id'] as String,
      cate_name: json['cate_name'] as String,
      subject: json['subject'] as String,
      date_start: json['date_start'] as String,
      date_end: json['date_end'] as String,
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      order: json['order'] as int,
      create_date: json['create_date'] as String,
    );
  }
}
