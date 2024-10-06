import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/appbar_search.dart';
import '../domain/entities/game_details.dart';
import 'bloc/details_bloc.dart';
import 'bloc/details_event.dart';
import 'bloc/details_state.dart';
import 'game_achievements.dart';
import 'game_guide.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _selectedIndex = 0;
  late List<String> _arguments;
  late String _userId;
  late String _gameId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _arguments = ModalRoute.of(context)!.settings.arguments as List<String>;
    _userId = _arguments[0];
    _gameId = _arguments[1];

    BlocProvider.of<DetailsBloc>(context).add(LoadGame(_userId, _gameId));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvokedWithResult: (canPop, result) {
          if (canPop) {}
        },
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 35, 35, 35),
            appBar: AppbarSearch(
              onSearchChanged: (query) {
                context.read<DetailsBloc>().add(SearchAchievements(_userId, _gameId, query));
              },
            ),
            body: BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) {
                if (state is DetailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DetailsLoaded) {
                  final game = state.game;
                  return _buildSelectedContent(_userId, game);
                } else if (state is DetailsError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('Нет доступных данных'));
              },
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
                selectedIndex: _selectedIndex,
                onItemSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                })));
  }

  Widget _buildSelectedContent(String userId, GameDetails game) {
    switch (_selectedIndex) {
      case 0:
        return GameAchievements(userId: userId, game: game);
      case 1:
        return GameGuide(game: game);
      default:
        return const Text('Ошибка');
    }
  }
}
