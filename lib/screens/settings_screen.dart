import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import '../utils/strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.i,
      builder: (_, __) {
        final s = AppState.i;
        return Scaffold(
          appBar: AppBar(title: Text(S.t('settings'))),
          body: ListView(padding: const EdgeInsets.all(12), children: [
            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.language),
                title: Text(S.t('language')),
                subtitle: Text(S.t('language_sub')),
                value: s.isVi,
                onChanged: s.setVi,
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.t('theme'),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      SegmentedButton<ThemeMode>(
                        segments: [
                          ButtonSegment(
                              value: ThemeMode.light,
                              icon: const Icon(Icons.light_mode),
                              label: Text(S.t('light'))),
                          ButtonSegment(
                              value: ThemeMode.dark,
                              icon: const Icon(Icons.dark_mode),
                              label: Text(S.t('dark'))),
                          ButtonSegment(
                              value: ThemeMode.system,
                              icon: const Icon(Icons.phone_android),
                              label: Text(S.t('system'))),
                        ],
                        selected: {s.themeMode},
                        onSelectionChanged: (v) => s.setTheme(v.first),
                      ),
                    ]),
              ),
            ),
          ]),
        );
      },
    );
  }
}