import 'package:graphql/client.dart';

import '../config/graphql.dart';
import '../models/characters.dart';

class CharactersGraphQL {
  final String _getCharacters = r'''
  query GetCharacters($page: Int){
    characters(page: $page) {
      info {
        count
        pages
        next
        prev
      }
      results {
        id
        name
        image
      }
    }
  }
  ''';

  Future<List<Character>> showCharacters(int index) async {
    final options =
        QueryOptions(document: gql(_getCharacters), variables:  {
      'page':index,
    });

    final response = await graphQlClient.query(options);

    if (!response.hasException) {
      final List<Object?> data = response.data!['characters']['results'];
      final values = data.map(
          (character) => Character.fromJson(character as Map<String, dynamic>));

      return values.toList();
    } else {
      print(response.exception);
      return [];
    }
  }
}
