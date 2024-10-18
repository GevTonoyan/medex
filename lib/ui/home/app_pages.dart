enum AppPages {
  main('main'),
  about('about'),
  services('services'),
  sales('sales'),
  //blog('blog'),
  news('news'),
  contact('contact');

  final String page;

  const AppPages(this.page);

  @override
  String toString() {
    return page;
  }
}
