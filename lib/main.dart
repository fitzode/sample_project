import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/config/routes.dart';
import 'package:test_app/modules/blog/screens/add_blog.dart';
import 'package:test_app/modules/blog/screens/blog_page.dart';
import 'package:test_app/modules/rick_morty/screen/rick_morty.dart';
import 'package:test_app/providers/blog_provider/blog_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.rickMortyPage,
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(settings, (context) {
          switch (settings.name) {
            case (Routes.rickMortyPage):
              return const RickMortyPage();
            case (Routes.blogPage):
              return const BlogPage();
            case (Routes.addBlogPage):
              final args = settings.arguments;
              if (args is BlogProvider) {
                return AddBlog(args);
              } else {
                return const SizedBox.shrink();
              }
            default:
              return const SizedBox.shrink();
          }
        });
      },
      home: const RickMortyPage(),
    );
  }
}
