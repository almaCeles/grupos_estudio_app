class Post {
  final String name;
  final String date;
  final String id;
  final String icon;
  Post({this.name, this.date, this.id, this.icon});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        name: json['name'],
        date: json['date'],
        id: json['_id'],
        icon: "topico.svg");
  }
}
