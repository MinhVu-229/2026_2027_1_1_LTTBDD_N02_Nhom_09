import 'package:flutter/material.dart';
import '../models/deck.dart';
import '../utils/app_state.dart';
import '../utils/data.dart';
import '../utils/strings.dart';
import 'flashcard_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _choose(BuildContext context, Deck d) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(title: Text(d.name, style: Theme.of(context).textTheme.titleLarge)),
          ListTile(
            leading: const Icon(Icons.style),
            title: Text(S.t('study')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => FlashcardScreen(deck: d)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.quiz),
            title: Text(S.t('quiz')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => QuizScreen(deck: d)));
            },
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.i,
      builder: (_, __) => Scaffold(
        appBar: AppBar(title: Text(S.t('decks'))),
        body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: decks.length,
          itemBuilder: (context, i) {
            final d = decks[i];
            final done =
                d.words.where((w) => AppState.i.learned.contains(w.word)).length;
            return Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(radius: 26, child: Icon(d.icon)),
                title: Text(d.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$done/${d.words.length} ${S.t('words')}'),
                      const SizedBox(height: 6),
                      LinearProgressIndicator(value: done / d.words.length),
                    ],
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _choose(context, d),
              ),
            );
          },
        ),
      ),
    );
  }
}