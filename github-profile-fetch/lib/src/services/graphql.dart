import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> _setup() {
  final httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final authLink = AuthLink(
    getToken: () => 'Bearer 15fd0f3c5e8dea5c3a980f8b2d010e27f96a7b26',
  );

  final link = authLink.concat(httpLink);

  final client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );

  return client;
}

final client = _setup();
