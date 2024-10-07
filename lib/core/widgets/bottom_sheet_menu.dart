import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentification/presentation/bloc/authentification_bloc.dart';
import '../../features/authentification/presentation/bloc/authentification_event.dart';

class BottomSheetMenu extends StatelessWidget {
  const BottomSheetMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 35, 35, 35),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          ListTile(
            leading: const Icon(
              size: 30,
              Icons.bookmark_added_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'Избранное',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/favoriteGames');
            },
          ),
          ListTile(
            leading: const Icon(
              size: 30,
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text(
              'Настройки',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              size: 30,
              Icons.exit_to_app_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'Выйти',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () async {
              context.read<AuthentificationBloc>().add(
                    const LogoutRequested(),
                  );
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
