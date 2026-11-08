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
      trailing: Text(
        value,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
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
          body: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              _tile(
                Icons.menu_book,
                Colors.blue,
                S.t('learned_words'),
                '${s.learned.length}/${allWords.length}',
              ),
              _tile(
                Icons.emoji_events,
                Colors.amber,
                S.t('best_score'),
                '${s.bestScore}/10',
              ),
              _tile(
                Icons.local_fire_department,
                Colors.orange,
                S.t('streak'),
                '${s.currentStreak} ${S.t('days')}',
              ),
              _tile(
                Icons.quiz,
                Colors.deepPurple,
                s.isVi ? 'Tổng bài kiểm tra' : 'Total quizzes',
                '${s.quizCount}',
              ),
              _tile(
                Icons.check_circle,
                Colors.green,
                s.isVi ? 'Tổng câu trả lời đúng' : 'Correct answers',
                '${s.totalCorrectAnswers}',
              ),
              _tile(
                Icons.cancel,
                Colors.red,
                s.isVi ? 'Tổng câu trả lời sai' : 'Wrong answers',
                '${s.totalWrongAnswers}',
              ),
              _tile(
                Icons.analytics,
                Colors.indigo,
                s.isVi ? 'Điểm trung bình' : 'Average score',
                '${s.averageScore.toStringAsFixed(1)}/10',
              ),
              const SizedBox(height: 20),
              Text(
                s.isVi ? 'Lịch sử kiểm tra' : 'Quiz history',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              if (s.quizHistory.isEmpty)
                Center(
                  child: Text(
                    s.isVi ? 'Chưa có lịch kiểm tra' : 'No quiz history',
                  ),
                )
              else
                ...List.generate(s.quizHistory.length, (index) {
                  final score = s.quizHistory[s.quizHistory.length - 1 - index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.assignment_turned_in,
                        color: Colors.indigo,
                      ),
                      title: Text(
                        '${s.isVi ? 'Bài kiểm tra' : 'Quiz'} ${s.quizHistory.length - index}',
                      ),
                      trailing: Text(
                        '$score/10',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
            ],
          ),
        );
      },
    );
  }
}
