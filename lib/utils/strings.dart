import 'app_state.dart';

class S {
  static const _m = <String, Map<String, String>>{
    'vi': {
      'decks': 'Bộ từ vựng', 'stats': 'Thống kê', 'settings': 'Cài đặt',
      'group': 'Nhóm', 'study': 'Học thẻ ghi nhớ', 'quiz': 'Kiểm tra trắc nghiệm',
      'flip_hint': 'Chạm vào thẻ để lật', 'know': 'Đã thuộc',
      'learned_words': 'Số từ đã học', 'best_score': 'Điểm cao nhất',
      'streak': 'Chuỗi ngày học', 'days': 'ngày', 'language': 'Tiếng Việt',
      'language_sub': 'Bật: Tiếng Việt, tắt: English', 'theme': 'Giao diện',
      'light': 'Sáng', 'dark': 'Tối', 'system': 'Hệ thống',
      'next': 'Câu tiếp', 'finish': 'Hoàn thành', 'retry': 'Làm lại',
      'score': 'Điểm của bạn', 'question': 'Câu', 'members': 'Thành viên',
      'student_id': 'MSSV', 'teacher': 'Giảng viên hướng dẫn',
      'repo': 'Repository Github', 'copied': 'Đã sao chép link',
      'words': 'từ',
      'course': 'Môn học', 'class_code': 'Mã lớp',
    },
    'en': {
      'decks': 'Decks', 'stats': 'Statistics', 'settings': 'Settings',
      'group': 'Group', 'study': 'Study flashcards', 'quiz': 'Take a quiz',
      'flip_hint': 'Tap the card to flip', 'know': 'I know it',
      'learned_words': 'Words learned', 'best_score': 'Best score',
      'streak': 'Study streak', 'days': 'days', 'language': 'Vietnamese',
      'language_sub': 'On: Vietnamese, off: English', 'theme': 'Theme',
      'light': 'Light', 'dark': 'Dark', 'system': 'System',
      'next': 'Next', 'finish': 'Finish', 'retry': 'Try again',
      'score': 'Your score', 'question': 'Question', 'members': 'Members',
      'student_id': 'Student ID', 'teacher': 'Supervisor',
      'repo': 'Github Repository', 'copied': 'Link copied',
      'words': 'words',
      'course': 'Course', 'class_code': 'Class code',
    },
  };

  static String t(String k) =>
      _m[AppState.i.isVi ? 'vi' : 'en']![k] ?? k;
}