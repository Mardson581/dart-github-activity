class GithubPayload {
  final String? repositoryId;
  final String? pushId;
  final String? ref;
  final String? head;
  final String? before;
  final String? action;

  GithubPayload({
    required this.repositoryId,
    this.pushId,
    this.ref,
    this.head,
    this.before,
    this.action
  });

  factory GithubPayload.fromJson(Map<String, dynamic> json) {
    return GithubPayload(
      repositoryId: json['repository_id'],
      pushId: json['push_id'],
      ref: json['ref'],
      head: json['head'],
      before: json['before'],
      action: json['action']
    );
  }
}
