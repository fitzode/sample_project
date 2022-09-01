import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_app/component/custom_appbar.dart';
import 'package:test_app/config/routes.dart';
import 'package:test_app/models/blog.dart';
import 'package:test_app/providers/blog_provider/blog_provider.dart';

import '../components/blog_item.dart';

class BlogPage extends HookConsumerWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _blogProvider = ref.watch(blogProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.addBlogPage,
                    arguments: _blogProvider);
              },
              child: const Text('Add blog'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _blogProvider.blogs.length,
                itemBuilder: (BuildContext context, int index) {
                  final blogData = _blogProvider.blogs[index];
                  return Tooltip(
                    message: 'Swipe me to delete',
                    child: Dismissible(
                      key: Key(blogData.id),
                      onDismissed: (d) {
                        _blogProvider.deleteBlog(blog: blogData);
                      },
                      child: BlogItem(blog: blogData),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
