class ListMarquee {
  final String id;
  final String description;
  final String create_date;

  ListMarquee({
    this.id,
    this.description,
    this.create_date,
  });

  factory ListMarquee.fromJson(Map<String, dynamic> json) {
    return ListMarquee(
      id: json['id'] as String,
      description: json['description'] as String,
      create_date: json['create_date'] as String,
    );
  }
}
