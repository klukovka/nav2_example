enum Destination {
  splash,
  login,
  home,
  contacts,
  settings;

  static List<Destination> get loggedInPages => [
        Destination.home,
        Destination.contacts,
        Destination.settings,
      ];
}
