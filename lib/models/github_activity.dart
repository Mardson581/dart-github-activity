class GithubActivity {
  final int id;
  final String type;
  final bool public;
  final DateTime? createdAt;

  GithubActivity({
    required this.id,
    required this.type,
    required this.public,
    this.createdAt
  });

  factory GithubActivity.fromJson(Map<String, dynamic> json) {
    return GithubActivity(
      id: json['id'],
      type: json['type'],
      public: json['public'],
      createdAt: _getDateFromString(json['created_at'])
    );
  }

  static DateTime? _getDateFromString(String date) {
    List<String> dateString = date.substring(0, date.indexOf('T')).split('-');

    try {
      return DateTime(
        dateString[0] as int,
        dateString[1] as int,
        dateString[2] as int
      );
    } catch (ex) {
      return null;
    }
  }
}