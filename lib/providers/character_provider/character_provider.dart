import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/char_graphql.dart';
import '../../models/characters.dart';
import '../api_provider/api_provider.dart';

final charactersProvider = ChangeNotifierProvider((ref) {
  final charactersGraphQL = ref.watch(apiProvider).characters;

  return CharactersNotifier(charactersAPI: charactersGraphQL);
});

class CharactersNotifier extends ChangeNotifier {
  final CharactersGraphQL charactersAPI;

  CharactersNotifier({
    required this.charactersAPI,
  });

  int index = 1;
  List<Character> _characters = [];
  List<Character> get characters => _characters;

  Future<List<Character>> getCharacters() async {
    final data = await charactersAPI.showCharacters(index);
    _characters = data;
    return _characters;
  }

  Future<List<Character>> getMoreCharacters() async {
    index++;
    final data = await charactersAPI.showCharacters(index);
    notifyListeners();
    _characters.addAll(data);
    return _characters;
  }
}
