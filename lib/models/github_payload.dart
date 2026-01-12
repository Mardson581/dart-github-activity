class GithubPayload {
  final int repositoryId;
  final int pushId;
  final String ref;
  final String head;
  final String before;

  GithubPayload({
    required this.repositoryId,
    required this.pushId, 
    required this.ref,
    required this.head,
    required this.before
  });

  factory GithubPayload.fromJson(Map<String, dynamic> json) {
    return GithubPayload(
      repositoryId: json['repository_id'],
      pushId: json['push_id'],
      ref: json['ref'],
      head: json['head'],
      before: json['before']
    );
  }
}