import 'dart:math';
import 'package:flutter/material.dart';
import '../models/deck.dart';
import '../models/word.dart';
import '../utils/app_state.dart';
import '../utils/data.dart';
import '../utils/strings.dart';

class _Q {
  final Word word;
  final List<String> options;
  _Q(this.word, this.options);
}

class QuizScreen extends StatefulWidget {
  final Deck deck;
  const QuizScreen({super.key, required this.deck});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<_Q> _qs;
  int _cur = 0, _score = 0;
  int? _picked;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    final rnd = Random();
    final pool = [...widget.deck.words]..shuffle(rnd);
    final others = allWords.where((w) => !pool.contains(w)).toList()
      ..shuffle(rnd);
    final picks = [...pool, ...others].take(10).toList(); // đủ 10 câu
    _qs = picks.map((w) {
      final wrong = allWords
          .where((x) => x.meaning != w.meaning)
          .map((x) => x.meaning)
          .toList()
        ..shuffle(rnd);
      final opts = [w.meaning, ...wrong.take(3)]..shuffle(rnd);
      return _Q(w, opts);
    }).toList();
    _cur = 0;
    _score = 0;
    _picked = null;
    _done = false;
  }

  void _pick(int i) {
    if (_picked != null) return;
    setState(() {
      _picked = i;
      if (_qs[_cur].options[i] == _qs[_cur].word.meaning) _score++;
    });
  }

  void _next() {
    if (_cur == _qs.length - 1) {
      AppState.i.recordQuiz(_score);
      setState(() => _done = true);
    } else {
      setState(() {
        _cur++;
        _picked = null;
      });
    }
  }

  Color? _color(int i) {
    if (_picked == null) return null;
    final q = _qs[_cur];
    if (q.options[i] == q.word.meaning) return Colors.green;
    if (i == _picked) return Colors.red;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.deck.name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _done ? _result() : _question(),
      ),
    );
  }

  Widget _result() => Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.emoji_events, size: 90, color: Colors.amber),
          const SizedBox(height: 12),
          Text(S.t('score'), style: const TextStyle(fontSize: 20)),
          Text('$_score / ${_qs.length}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          FilledButton(
              onPressed: () => setState(_start), child: Text(S.t('retry'))),
        ]),
      );

  Widget _question() {
    final q = _qs[_cur];
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      LinearProgressIndicator(value: (_cur + 1) / _qs.length),
      const SizedBox(height: 16),
      Text('${S.t('question')} ${_cur + 1}/${_qs.length}'),
      const SizedBox(height: 24),
      Text(q.word.word,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
      Text(q.word.phonetic,
          textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
      const SizedBox(height: 24),
      for (int i = 0; i < q.options.length; i++)
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FilledButton.tonal(
            style: FilledButton.styleFrom(
              backgroundColor: _color(i),
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () => _pick(i),
            child: Text(q.options[i], style: const TextStyle(fontSize: 18)),
          ),
        ),
      const Spacer(),
      if (_picked != null)
        FilledButton(
          onPressed: _next,
          child: Text(_cur == _qs.length - 1 ? S.t('finish') : S.t('next')),
        ),
    ]);
  }
}