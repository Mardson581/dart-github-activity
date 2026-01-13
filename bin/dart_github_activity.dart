import 'package:dart_github_activity/models/github_activity.dart';
import 'package:dart_github_activity/repository/api_repository.dart';

void main(List<String> arguments) async {
  if (arguments.isEmpty || arguments.length > 2) {
    print("Error: bad arguments");
    print("Usage: dart run <username> [page number]");
    return;
  }

  try {
    ApiRepository repository = ApiRepository();
    int? page;

    if (arguments.length == 2) {
      page = int.tryParse(arguments[1]);
    }
    page ??= 1;

    List<GithubActivity> activities = await repository.getUserActivitiesByPage(
      arguments[0],
      page,
    );

    if (activities.isEmpty) {
      print("No activities were found for user ${arguments[0]}");
    }

    for (GithubActivity activity in activities) {
      switch (activity.type) {
        case "PushEvent":
          print(
            "${activity.actor?.displayLogin} pushed to ${activity.repo?.name}",
          );
          break;
        case "IssuesEvent":
          print(
            "${activity.actor?.displayLogin} ${activity.payload?.action} an issue in ${activity.repo?.name}",
          );
          break;
        case "WatchEvent":
          print(
            "${activity.actor?.displayLogin} starred ${activity.repo?.name}",
          );
          break;
        case "ForkEvent":
          print(
            "${activity.actor?.displayLogin} forked ${activity.repo?.name}",
          );
          break;
        case "CreateEvent":
          print(
            "${activity.actor?.displayLogin} created ${activity.repo?.name}",
          );
          break;
        default:
          print(
            "${activity.type.replaceFirst("Event", "")} in ${activity.repo?.name}",
          );
          break;
      }
    }
  } catch (ex) {
    print(ex);
  }
}
