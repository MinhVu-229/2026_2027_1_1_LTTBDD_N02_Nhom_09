import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  AppState._();
  static final AppState i = AppState._();

  late SharedPreferences _p;
  bool isVi = true;
  ThemeMode themeMode = ThemeMode.system;
  Set<String> learned = {};
  int bestScore = 0;
  int streak = 0;
  String lastDate = '';
  // Thống kê bài kiểm tra
  int quizCount = 0;
  int totalCorrectAnswers = 0;
  int totalAnsweredQuestions = 0;

  // Lịch sử điểm
  List<int> quizHistory = [];

  Future<void> load() async {
    _p = await SharedPreferences.getInstance();
    isVi = _p.getBool('vi') ?? true;
    themeMode = ThemeMode.values[_p.getInt('theme') ?? 0];
    learned = (_p.getStringList('learned') ?? []).toSet();
    bestScore = _p.getInt('best') ?? 0;
    streak = _p.getInt('streak') ?? 0;
    lastDate = _p.getString('last') ?? '';
    quizCount = _p.getInt('quizCount') ?? 0;
    totalCorrectAnswers = _p.getInt('totalCorrectAnswers') ?? 0;
    totalAnsweredQuestions = _p.getInt('totalAnsweredQuestions') ?? 0;
    quizHistory = (_p.getStringList('quizHistory') ?? [])
        .map((e) => int.tryParse(e) ?? 0)
        .toList();
  }

  String _fmt(DateTime d) => '${d.year}-${d.month}-${d.day}';

  /// Chuỗi ngày hiển thị (về 0 nếu bỏ lỡ hơn 1 ngày)
  int get currentStreak {
    final now = DateTime.now();
    if (lastDate == _fmt(now) ||
        lastDate == _fmt(now.subtract(const Duration(days: 1)))) {
      return streak;
    }
    return 0;
  }

  void _touchStreak() {
    final now = DateTime.now();
    final today = _fmt(now);
    if (lastDate == today) return;
    final yesterday = _fmt(now.subtract(const Duration(days: 1)));
    streak = lastDate == yesterday ? streak + 1 : 1;
    lastDate = today;
    _p.setInt('streak', streak);
    _p.setString('last', lastDate);
  }

  void markLearned(String word) {
    learned.add(word);
    _p.setStringList('learned', learned.toList());
    _touchStreak();
    notifyListeners();
  }

  void recordQuiz(int score) {
    if (score > bestScore) {
      bestScore = score;
      _p.setInt('best', score);
    }
    quizCount++;
    totalCorrectAnswers += score;
    totalAnsweredQuestions += 10;
    quizHistory.add(score);
    _p.setInt('quizCount', quizCount);
    _p.setInt('totalCorrectAnswers', totalCorrectAnswers);
    _p.setInt('totalAnsweredQuestions', totalAnsweredQuestions);
    _p.setStringList(
      'quizHistory',
      quizHistory.map((e) => e.toString()).toList(),
    );
    _touchStreak();
    notifyListeners();
  }

  void setVi(bool v) {
    isVi = v;
    _p.setBool('vi', v);
    notifyListeners();
  }

  void setTheme(ThemeMode m) {
    themeMode = m;
    _p.setInt('theme', m.index);
    notifyListeners();
  }

  int get totalWrongAnswers => totalAnsweredQuestions - totalCorrectAnswers;
  double get averageScore =>
      quizCount == 0 ? 0 : totalCorrectAnswers / quizCount;
  double get correctRate => totalAnsweredQuestions == 0
      ? 0
      : totalCorrectAnswers / totalAnsweredQuestions;
}
