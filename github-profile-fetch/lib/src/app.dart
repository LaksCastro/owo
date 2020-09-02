import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/src/services/graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'constants/theme_config.dart';
import 'routes/app_routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: client,
        child: CacheProvider(
            child: MaterialApp(
                title: 'BloC Training',
                theme: buildAppTheme(),
                routes: AppRoutes.routes())));
  }
}
