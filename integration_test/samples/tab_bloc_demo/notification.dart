class NotificationEntity {
  final int id;
  final String title;
  final String subTitle;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.subTitle,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
    };
  }

  factory NotificationEntity.fromMap(Map<String, dynamic> map) {
    return NotificationEntity(
      id: map['id'] as int,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
    );
  }
}
