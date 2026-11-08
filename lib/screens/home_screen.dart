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
            return _DeckCard(
              deck: d,
              done: done,
              onTap: () => _choose(context, d),
            );
          },
        ),
      ),
    );
  }
}

class _DeckCard extends StatefulWidget {
  final Deck deck;
  final int done;
  final VoidCallback onTap;
  const _DeckCard(
      {required this.deck, required this.done, required this.onTap});

  @override
  State<_DeckCard> createState() => _DeckCardState();
}

class _DeckCardState extends State<_DeckCard> {
  bool _hover = false;
  bool _press = false;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final active = _hover || _press;
    final d = widget.deck;

    final Color? bg = active
        ? (dark ? const Color(0xFF2A2340) : const Color(0xFFF7F4FE))
        : (dark ? null : Colors.white);
    final Color border = active
        ? (dark ? const Color(0xFF6B4FBF) : const Color(0xFFDDD0FB))
        : (dark ? Colors.white24 : const Color(0xFFE5E7EB));
    final Color? titleColor = active
        ? (dark ? const Color(0xFFB79CFF) : const Color(0xFF5B21D6))
        : null;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Listener(
        onPointerDown: (_) => setState(() => _press = true),
        onPointerUp: (_) => setState(() => _press = false),
        onPointerCancel: (_) => setState(() => _press = false),
        child: Card(
          color: bg,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: border),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(radius: 26, child: Icon(d.icon)),
            title: Text(d.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: titleColor)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.done}/${d.words.length} ${S.t('words')}'),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(value: widget.done / d.words.length),
                ],
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: widget.onTap,
          ),
        ),
      ),
    );
  }
}