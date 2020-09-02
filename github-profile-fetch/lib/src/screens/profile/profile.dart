import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/src/models/user_data.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String getQuery() {
  return """
  query GetUser(\$username: String!){ 
    user(login: \$username) { 
      avatarUrl
      bio
      login
      url
    }
  }
  """;
}

class ProfileScreen extends StatelessWidget {
  final String username;
  const ProfileScreen({Key key, this.username}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Profile of $username")),
        body: Query(
          options: QueryOptions(
              documentNode: gql(getQuery()), variables: {"username": username}),
          builder: (result, {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.loading) {
              return Text('Loading');
            }

            final userData = UserData(
              bio: result.data["user"]["bio"],
              photoUrl: result.data["user"]["avatarUrl"],
              githubUrl: result.data["user"]["url"],
              username: result.data["user"]["login"],
            );

            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(userData.photoUrl, width: 200),
                ),
                Text("Username: ${userData.username}"),
                Text("Bio: ${userData.bio}"),
                FlatButton(
                  child: Text("Open Github URL: ${userData.githubUrl}"),
                  onPressed: () {
                    print("ado ado ado qm clica no botao eh ________");
                  },
                )
              ],
            ));
          },
        ));
  }
}
