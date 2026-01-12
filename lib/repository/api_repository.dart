import 'package:dart_github_activity/models/github_activity.dart';
import 'package:dart_github_activity/models/github_actor.dart';
import 'package:dart_github_activity/models/github_payload.dart';
import 'package:dart_github_activity/models/github_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiRepository {
  final String urlBase = "https://api.github.com/users/<username>/events?page=<page>";

  Future<List<Map<String, dynamic>>>
    getJsonActivityByUsername(String user, [int page=1]) async {
      final uriWithUsername = Uri.parse(
          urlBase.replaceFirst('<username>', user).replaceFirst('<page>', page.toString()));

      final httpResponse = await http.get(uriWithUsername);
      if (httpResponse.statusCode != 200) {
        throw Exception("Couldn't fetch data for user $user - status ${httpResponse.statusCode}");
      }

      return json.decode(httpResponse.body) as List<Map<String, dynamic>>;
  }

  GithubActor? getActorFromJson(Map<String, dynamic> json) {
    if (json['actor'] == null) {
      return null;
    }

    return GithubActor.fromJson(json['actor']);
  }

  GithubRepository? getRepositoryFromJson(Map<String, dynamic> json) {
    if (json['repo'] == null) {
      return null;
    }

    return GithubRepository.fromJson(json['actor']);
  }

  GithubPayload? getPayloadFromJson(Map<String, dynamic> json) {
    if (json['actor'] == null) {
      return null;
    }

    return GithubPayload.fromJson(json['actor']);
  }

  GithubActivity getActivityFromJson(Map<String, dynamic> json) {
    GithubActivity activity = GithubActivity.fromJson(json);
    activity.actor = getActorFromJson(json);
    activity.repo = getRepositoryFromJson(json);
    activity.payload = getPayloadFromJson(json);
    
    return activity;
  }

  Future<List<GithubActivity?>> 
    getUserActivitiesByPage(String user, [int page=1]) async {
      var jsonList = await getJsonActivityByUsername(user, page);
      List<GithubActivity> list = [];

      for (Map<String, dynamic> activityData in jsonList) {
        list.add(getActivityFromJson(activityData));
      }
      return list;
  }
}