import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/deck.dart';
import '../models/word.dart';
import '../utils/app_state.dart';
import '../utils/strings.dart';
import '../widgets/flip_card.dart';

class FlashcardScreen extends StatefulWidget {
  final Deck deck;
  const FlashcardScreen({super.key, required this.deck});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  final _page = PageController();
  final _tts = FlutterTts();
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('en-US');
  }

  @override
  void dispose() {
    _page.dispose();
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    await _tts.stop();
    await _tts.speak(text);
  }

  Widget _front(Word w) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(w.word,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(w.phonetic, style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 16),
          IconButton.filledTonal(
            iconSize: 36,
            icon: const Icon(Icons.volume_up),
            onPressed: () => _speak(w.word),
          ),
          const SizedBox(height: 24),
          Text(S.t('flip_hint'), style: const TextStyle(color: Colors.grey)),
        ]),
      );

  Widget _back(Word w) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(w.meaning,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          Text(w.example,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
        ]),
      );

  @override
  Widget build(BuildContext context) {
    final words = widget.deck.words;
    return ListenableBuilder(
      listenable: AppState.i,
      builder: (_, __) {
        final w = words[_index];
        final known = AppState.i.learned.contains(w.word);
        return Scaffold(
          appBar: AppBar(
              title: Text('${widget.deck.name}  ${_index + 1}/${words.length}')),
          body: Column(children: [
            Expanded(
              child: PageView.builder(
                controller: _page,
                itemCount: words.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: FlipCard(front: _front(words[i]), back: _back(words[i])),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: known ? null : () => AppState.i.markLearned(w.word),
                  icon: Icon(known ? Icons.check_circle : Icons.check),
                  label: Text(S.t('know')),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}