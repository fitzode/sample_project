import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/char_graphql.dart';

final apiProvider = Provider<ApiProvider>((ref) => ApiProvider());

class ApiProvider {
  final characters = CharactersGraphQL();
}
