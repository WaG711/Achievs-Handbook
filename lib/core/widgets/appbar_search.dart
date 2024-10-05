import 'package:flutter/material.dart';

import 'bottom_sheet_menu.dart';

class AppbarSearch extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearchChanged;
  const AppbarSearch({super.key, required this.onSearchChanged});

  @override
  State<AppbarSearch> createState() => _AppbarSearchState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarSearchState extends State<AppbarSearch> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      foregroundColor: Colors.white,
      title: _isSearching
          ? TextField(
              autofocus: true,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.green,
              decoration: const InputDecoration(
                hintText: 'Введите запрос',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              onChanged: (query) {
                setState(() {
                  widget.onSearchChanged(query);
                });
              },
            )
          : null,
      actions: [
        _isSearching
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    widget.onSearchChanged('');
                  });
                },
              )
            : IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  setState(() {
                    _isSearching = true;
                  });
                },
              ),
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.menu_rounded),
          onPressed: () async {
            await showModalBottomSheet(
              context: context,
              builder: (context) {
                return const BottomSheetMenu();
              },
            );
          },
        )
      ],
    );
  }
}
