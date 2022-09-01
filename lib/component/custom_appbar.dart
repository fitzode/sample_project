import 'package:flutter/material.dart';
import 'package:test_app/config/routes.dart';

class CustomAppBar extends PreferredSize {
  final Size _preferredSize;

  CustomAppBar({
    Key? key,
    Size? preferredSIze,
  })  : _preferredSize = const Size.fromHeight(75),
        super(
          key: key,
          preferredSize: const Size.fromHeight(75),
          child: Container(),
        );

  @override
  Size get preferredSize => _preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              child: MenuButton(
                text: 'Rick & Morty',
                routeName: Routes.rickMortyPage,
              ),
            ),
            Expanded(
              child: MenuButton(
                text: 'Blog',
                routeName: Routes.blogPage,
              ),
            ),
          ],
        ));
  }
}

class MenuButton extends StatelessWidget {
  final String? text;
  final String routeName;

  const MenuButton({
    Key? key,
    this.text,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)!.settings.name;

    return Container(
      height: 75,
      constraints: const BoxConstraints(minWidth: 50),
      child: TextButton(
        child: Text(text!, style: const TextStyle(color: Colors.white)),
        onPressed: () {
          if (route != routeName) {
            Navigator.pushNamed(context, routeName);
          }
        },
      ),
    );
  }
}
