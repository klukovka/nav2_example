enum Destination {
  splash,
  login,
  home,
  posts,
  settings;

  static List<Destination> get loggedInPages => [
        Destination.home,
        Destination.posts,
        Destination.settings,
      ];
}
