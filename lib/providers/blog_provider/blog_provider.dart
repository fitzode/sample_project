import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_app/models/blog.dart';

final blogProvider = ChangeNotifierProvider((_) {
  return BlogProvider();
});

class BlogProvider extends ChangeNotifier {
  bool _isExpanded = false;
  List<Blog> _blogs = [
    Blog(
        id: '1',
        title: 'News 1',
        subtitle: 'News subtitle 1',
        body: 'lorem ipsum',
        date: DateTime.now().toString()),
    Blog(
        id: '2',
        title: 'News 2',
        subtitle: 'News subtitle 2',
        body: 'lorem ipsum',
        date: DateTime.now().toString()),
    Blog(
        id: '3',
        title: 'News 3',
        subtitle: 'News subtitle 3',
        body: 'lorem ipsum',
        date: DateTime.now().toString()),
    Blog(
        id: '4',
        title: 'News 4',
        subtitle: 'News subtitle 4',
        body: 'lorem ipsum',
        date: DateTime.now().toString())
  ];

  Future<List<Blog>> getBlogs() async {
    final data = await getBlogs();
    _blogs = data;
    return _blogs;
  }

  Future<void> addBlog({required Blog blog, context}) async {
    final newDataBlog = blog;

    if (!_blogs.contains(blog)) {
      _blogs.add(newDataBlog);
      Navigator.pop(context);
      notifyListeners();
    }
  }

  Future<void> deleteBlog({required Blog blog}) async {
    _blogs.removeWhere((todo) => todo.id == blog.id);
    notifyListeners();
  }

  void expandBody() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  List<Blog> get blogs => _blogs;
  bool get isExpanded => _isExpanded;
}
