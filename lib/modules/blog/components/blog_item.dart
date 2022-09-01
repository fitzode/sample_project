import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test_app/models/blog.dart';

import '../../../providers/blog_provider/blog_provider.dart';

class BlogItem extends HookConsumerWidget {
  final Blog blog;
  const BlogItem({super.key, required this.blog});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _blogProvider = ref.watch(blogProvider);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Color(0xff0048BA),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  blog.subtitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    blog.body,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    maxLines: _blogProvider.isExpanded ? null : 4,
                    overflow:
                        _blogProvider.isExpanded ? null : TextOverflow.ellipsis,
                  ),
                ),
                blog.body.characters.length > 50
                    ? InkWell(
                        onTap: () {
                          _blogProvider.expandBody();
                        },
                        child: Text(
                          _blogProvider.isExpanded ? 'Hide' : 'See more',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
