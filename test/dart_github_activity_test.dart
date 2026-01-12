import 'package:dart_github_activity/models/github_activity.dart';
import 'package:dart_github_activity/repository/api_repository.dart';

void main() async {
  ApiRepository api = ApiRepository();
  List<GithubActivity> list = await api.getUserActivitiesByPage("Mardson581");
  GithubActivity ac = list[0];
  print(ac.payload?.repositoryId);
}
