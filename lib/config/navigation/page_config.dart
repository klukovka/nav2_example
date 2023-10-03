import 'package:equatable/equatable.dart';
import 'package:nav2_example/config/navigation/app_page.dart';
import 'package:nav2_example/config/navigation/routes.dart';

class PageConfig extends Equatable {
  ///full path to the page
  late final Uri uri;

  ///to make it easier to use the path with different interfaces
  late final String route;

  ///an identifier for the page (optional)
  final String? name;

  ///page args: can be added in the path as a string literal, or manually when creating the route
  final Map<String, dynamic> args = {};

  ///Our route description, this is where actual builds happen
  late final AppRoute page;

  PageConfig({
    required String location,
    Map<String, dynamic>? args,
    this.name,
  }) {
    uri = location.isNotEmpty
        ? Uri(path: location, queryParameters: args)
        : Uri.parse('/');
    route = uri.toString();
    this.args.addIfNotNull(args);

    ///get the page from defined pages
    page = getRoute(this);
  }

  @override
  String toString() {
    return 'PageConfig: path = $uri, args = $args';
  }

  @override
  List<Object?> get props => [uri, args];
}

///An extension function to facilitate adding nullable Maps (I need it in other places, declared it here for clarity)
extension AddNullableMap on Map {
  void addIfNotNull(Map? other) {
    if (other != null) {
      addAll(other);
    }
  }
}
