import 'package:flutter/cupertino.dart';

class Routes {
  static const blogPage = '/blog';
  static const rickMortyPage = '/rick_morty';
  static const addBlogPage = '/addblog';

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
