import 'package:flutter/material.dart';
import 'package:base/src/constants.dart';
import 'package:github/github.dart';
import 'github_login.dart';

class GithubPage extends StatelessWidget {
  final String title;
  const GithubPage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GithubLoginWidget(
      builder: (context, client) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: const Center(
            child: Text(
              'You are logged in to GitHub!',
            ),
          ),
        );
      },
      githubClientId: githubClientId,
      githubClientSecret: githubClientSecret, 
      githubScopes: githubScopes
    );
  }
}

class GithubHome extends StatelessWidget {
  const GithubHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GithubLoginWidget(
      builder: (context, httpClient) {
        return FutureBuilder<CurrentUser>(
          future: viewerDetail(httpClient.credentials.accessToken),
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Center(
                child: Text(
                  snapshot.hasData
                  ? 'Hello ${snapshot.data!.login}'
                  : 'Retrieving viewer login details...',
                ),
              ),
            );
          },
        );
      }, 
      githubClientId: githubClientId, 
      githubClientSecret: githubClientSecret, 
      githubScopes: githubScopes
    );
  }
}

Future<CurrentUser> viewerDetail(String accessToken) async {
  final github = GitHub(auth:  Authentication.withToken(accessToken));
  return github.users.getCurrentUser();
}