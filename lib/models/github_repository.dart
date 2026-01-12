class GithubRepository {
  final int id;
  final String? name;
  final String url;

  GithubRepository({
    required this.id,
    required this.name,
    required this.url
  });

  factory GithubRepository.fromJson(Map<String, dynamic> json) {
    return GithubRepository(
      id: json['id'],
      name: json['name'],
      url: json['url']
    );
  }
}