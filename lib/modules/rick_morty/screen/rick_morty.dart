import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/custom_appbar.dart';
import '../../../providers/character_provider/character_provider.dart';
import '../components/character_list_tile.dart';

class RickMortyPage extends HookConsumerWidget {
  const RickMortyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useScrollController();
    final _isLoading = useState(false);
    final _charactersProvider = ref.watch(charactersProvider);

    _loadData() async {
      _isLoading.value = true;

      try {
        await _charactersProvider.getCharacters();
      } on Exception catch (error) {
        print(error);
      }

      _isLoading.value = false;
    }

    _loadMore() async {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        try {
          await _charactersProvider.getMoreCharacters();
        } on Exception catch (error) {
          print(error);
        }
      }
    }

    useEffect(() {
      _controller.addListener(_loadMore);
      _loadData();

      return;
    }, []);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Builder(
        builder: (BuildContext context) {
          if (_isLoading.value) {
            return const LoadingIndicator();
          }

          if (!_isLoading.value && _charactersProvider.characters.isEmpty) {
            return const Text('No data');
          }

          return ListView.separated(
            controller: _controller,
            padding: const EdgeInsets.all(8),
            itemCount: _charactersProvider.characters.length,
            itemBuilder: (BuildContext context, int index) {
              final character = _charactersProvider.characters[index];

              return CharacterListItem(
                character: character,
              );
            },
            separatorBuilder: (ctx, i) {
              return const SizedBox(
                height: 10,
              );
            },
          );
        },
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
