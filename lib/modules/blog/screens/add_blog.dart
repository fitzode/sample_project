import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_app/models/blog.dart';
import 'package:test_app/modules/blog/components/textfield_input.dart';

import '../../../providers/blog_provider/blog_provider.dart';

class AddBlog extends HookWidget {
  final BlogProvider blogProvider;
  const AddBlog(this.blogProvider, {super.key});

  @override
  Widget build(BuildContext context) {
    final blogTitleTextController = useTextEditingController();
    final blogSubtitleTextController = useTextEditingController();
    final _formKey = GlobalKey<FormState>();
    final blogBodyTextController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                title: 'Title',
                textfieldWidth: MediaQuery.of(context).size.width * 0.4,
                controller: blogTitleTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                title: 'Subtitle',
                textfieldWidth: MediaQuery.of(context).size.width * 0.4,
                controller: blogSubtitleTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                title: 'Body',
                textfieldWidth: MediaQuery.of(context).size.width * 0.4,
                controller: blogBodyTextController,
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    blogProvider.addBlog(
                        blog: Blog(
                          id: (blogProvider.blogs.length + 1).toString(),
                          title: blogTitleTextController.text,
                          subtitle: blogSubtitleTextController.text,
                          body: blogBodyTextController.text,
                          date: DateTime.now().toString(),
                        ),
                        context: context);
                  }
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
