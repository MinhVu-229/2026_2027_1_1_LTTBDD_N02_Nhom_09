import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import 'word.dart';

class Deck {
  final String nameVi;
  final String nameEn;
  final IconData icon;
  final List<Word> words;
  const Deck(this.nameVi, this.nameEn, this.icon, this.words);

  String get name => AppState.i.isVi ? nameVi : nameEn;
}