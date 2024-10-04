import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationCheck extends StatelessWidget {
  const AuthentificationCheck({super.key});

  Future<String?> _getUserId() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    if (await prefs.getBool('isLoggedIn') ?? false) {
      final userId = prefs.getString('userId');
      return userId;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/home', arguments: snapshot.data);
          });
        } else if (!snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/login');
          });
        } else if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        }
        return Container();
      },
    );
  }
}
