import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../models/characters.dart';

class CharacterListItem extends HookWidget {
  final Character character;

  const CharacterListItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(character.image ?? ''),
      title: Text(character.name ?? ''),
    );
  }
}
