import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import '../utils/data.dart';
import '../utils/strings.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  Widget _tile(IconData icon, Color color, String title, String value) => Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Icon(icon, size: 40, color: color),
          title: Text(title),
          trailing: Text(value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.i,
      builder: (_, __) {
        final s = AppState.i;
        return Scaffold(
          appBar: AppBar(title: Text(S.t('stats'))),
          body: ListView(padding: const EdgeInsets.all(12), children: [
            _tile(Icons.menu_book, Colors.blue, S.t('learned_words'),
                '${s.learned.length}/${allWords.length}'),
            _tile(Icons.emoji_events, Colors.amber, S.t('best_score'),
                '${s.bestScore}/10'),
            _tile(Icons.local_fire_department, Colors.orange, S.t('streak'),
                '${s.currentStreak} ${S.t('days')}'),
          ]),
        );
      },
    );
  }
}