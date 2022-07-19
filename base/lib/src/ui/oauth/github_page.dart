import 'package:flutter/material.dart';
import 'package:base/src/constants.dart';
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