class ListImpressionImg {
  final String file;

  ListImpressionImg({this.file});

  factory ListImpressionImg.fromJson(Map<String, dynamic> json) {
    return ListImpressionImg(
      file: json['file'] as String,
    );
  }
}

class ListImpression {
  final String id;
  final String uploadKey;
  final String subject;
  final String description;
  final int comment_num;
  final int like_num;
  final String create_date;
  final String display_image;

  ListImpression(
      {this.id,
      this.subject,
      this.uploadKey,
      this.description,
      this.comment_num,
      this.like_num,
      this.create_date,
      this.display_image});

  factory ListImpression.fromJson(Map<String, dynamic> json) {
    return ListImpression(
      id: json['id'] as String,
      subject: json['subject'] as String,
      uploadKey: json['uploadKey'] as String,
      description: json['description'] as String,
      comment_num: json['comment_num'] as int,
      like_num: json['like_num'] as int,
      create_date: json['create_date'] as String,
      display_image: json['display_image'] as String,
    );
  }
}

class ListImpressionComment {
  final String id;
  final String name;
  final String lastname;
  final String uploadKey;
  final String description;
  final String create_date;

  ListImpressionComment(
      {this.id,
      this.name,
      this.lastname,
      this.uploadKey,
      this.description,
      this.create_date});

  factory ListImpressionComment.fromJson(Map<String, dynamic> json) {
    return ListImpressionComment(
      id: json['id'] as String,
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      uploadKey: json['uploadKey'] as String,
      description: json['description'] as String,
      create_date: json['create_date'] as String,
    );
  }
}
