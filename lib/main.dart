import 'package:flutter/material.dart';
import 'screens/group_info_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/stats_screen.dart';
import 'utils/app_state.dart';
import 'utils/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppState.i.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.i,
      builder: (_, __) => MaterialApp(
        title: 'English Flashcard',
        debugShowCheckedModeBanner: false,
        themeMode: AppState.i.themeMode,
        theme: ThemeData(
            colorSchemeSeed: Colors.indigo, useMaterial3: true),
        darkTheme: ThemeData(
            colorSchemeSeed: Colors.indigo,
            brightness: Brightness.dark,
            useMaterial3: true),
        home: const MainShell(),
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _i = 0;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.i,
      builder: (_, __) => Scaffold(
        body: IndexedStack(index: _i, children: const [
          HomeScreen(),
          StatsScreen(),
          SettingsScreen(),
          GroupInfoScreen(),
        ]),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _i,
          onDestinationSelected: (v) => setState(() => _i = v),
          destinations: [
            NavigationDestination(
                icon: const Icon(Icons.style), label: S.t('decks')),
            NavigationDestination(
                icon: const Icon(Icons.bar_chart), label: S.t('stats')),
            NavigationDestination(
                icon: const Icon(Icons.settings), label: S.t('settings')),
            NavigationDestination(
                icon: const Icon(Icons.groups), label: S.t('group')),
          ],
        ),
      ),
    );
  }
}