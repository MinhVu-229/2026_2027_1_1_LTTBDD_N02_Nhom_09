import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_state.dart';
import '../utils/strings.dart';

class GroupInfoScreen extends StatelessWidget {
  const GroupInfoScreen({super.key});

  static const course = 'Lập trình thiết bị di động';
  static const classCode = '2026_2027_1_1_LTTBDD_N02';
  static const groupName = 'Nhóm 09';
  static const teacher = 'ThS. Nguyễn Xuân Quế';
  static const members = [
    ('Vũ Minh Nguyệt', '23010129'),
    ('Nguyễn Xuân Thanh', '23010073'),
    ('Trần Thị Ngoãn', '23010154'),
  ];
  static const repo =
      'https://github.com/MinhVu-229/2026_2027_1_1_LTTBDD_N02_Nhom_09';

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.i,
      builder: (context, __) => Scaffold(
        appBar: AppBar(title: Text(S.t('group'))),
        body: ListView(padding: const EdgeInsets.all(12), children: [
          Card(
            child: Column(children: [
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: Text(S.t('course')),
                subtitle: const Text(course),
              ),
              ListTile(
                leading: const Icon(Icons.tag),
                title: Text(S.t('class_code')),
                subtitle: const Text(classCode),
              ),
            ]),
          ),
          Card(
            child: Column(children: [
              ListTile(
                title: Text('${S.t('members')} - $groupName',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              for (final m in members)
                ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(m.$1),
                  subtitle: Text('${S.t('student_id')}: ${m.$2}'),
                ),
            ]),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.school),
              title: Text(S.t('teacher')),
              subtitle: const Text(teacher),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.code),
              title: Text(S.t('repo')),
              subtitle: const Text(repo),
              trailing: const Icon(Icons.copy),
              onTap: () {
                Clipboard.setData(const ClipboardData(text: repo));
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(S.t('copied'))));
              },
            ),
          ),
        ]),
      ),
    );
  }
}