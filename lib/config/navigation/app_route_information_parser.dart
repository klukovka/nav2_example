import 'package:flutter/material.dart';
import 'package:nav2_example/config/navigation/page_config.dart';

class AppRouteInformationParser extends RouteInformationParser<PageConfig> {
  ///get a location (path) from the system and build your route wrapping object
  @override
  Future<PageConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final String path = routeInformation.uri.path;
    PageConfig config = PageConfig(
      location: path,
      args: routeInformation.uri.queryParameters,
    );
    return config;
  }

  ///update the URL bar with the latest URL from the app
  @override
  RouteInformation? restoreRouteInformation(PageConfig configuration) {
    return RouteInformation(uri: configuration.uri);
  }
}
