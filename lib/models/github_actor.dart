class GithubActor {
  final int id;
  final String login;
  final String displayLogin;

  GithubActor({
    required this.id,
    required this.login,
    required this.displayLogin
  });

  factory GithubActor.fromJson(Map<String, dynamic> json) {
    return GithubActor(
      id: json['id'],
      login: json['login'],
      displayLogin: json['display_login']
    );
  }
}