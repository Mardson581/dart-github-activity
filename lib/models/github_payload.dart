class GithubPayload {
  final int? repositoryId;
  final int? pushId;
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
