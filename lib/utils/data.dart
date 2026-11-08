import 'package:flutter/material.dart';
import '../models/deck.dart';
import '../models/word.dart';

const decks = <Deck>[
  Deck('Gia đình', 'Family', Icons.family_restroom, [
    Word('mother', '/ˈmʌðər/', 'mẹ', 'My mother cooks dinner every day.'),
    Word('father', '/ˈfɑːðər/', 'bố', 'My father works in a bank.'),
    Word('sister', '/ˈsɪstər/', 'chị/em gái', 'I have one younger sister.'),
    Word('brother', '/ˈbrʌðər/', 'anh/em trai', 'My brother plays football.'),
    Word('grandmother', '/ˈɡrænmʌðər/', 'bà', 'My grandmother tells great stories.'),
    Word('uncle', '/ˈʌŋkl/', 'chú/bác/cậu', 'My uncle lives in Hanoi.'),
  ]),
  Deck('Giải trí', 'Entertainment', Icons.movie, [
    Word('movie', '/ˈmuːvi/', 'phim', 'We watch a movie on Sunday.'),
    Word('music', '/ˈmjuːzɪk/', 'âm nhạc', 'She listens to music every night.'),
    Word('game', '/ɡeɪm/', 'trò chơi', 'This game is very fun.'),
    Word('concert', '/ˈkɑːnsərt/', 'buổi hòa nhạc', 'I went to a concert last week.'),
    Word('party', '/ˈpɑːrti/', 'bữa tiệc', 'Come to my birthday party!'),
    Word('hobby', '/ˈhɑːbi/', 'sở thích', 'Reading is my favorite hobby.'),
  ]),
  Deck('Học tập', 'Study', Icons.school, [
    Word('book', '/bʊk/', 'quyển sách', 'I borrow a book from the library.'),
    Word('teacher', '/ˈtiːtʃər/', 'giáo viên', 'Our teacher is very kind.'),
    Word('homework', '/ˈhoʊmwɜːrk/', 'bài tập về nhà', 'I finish my homework before dinner.'),
    Word('exam', '/ɪɡˈzæm/', 'kỳ thi', 'The exam starts at 8 a.m.'),
    Word('library', '/ˈlaɪbrəri/', 'thư viện', 'The library is quiet.'),
    Word('lesson', '/ˈlesn/', 'bài học', 'Today’s lesson is easy.'),
  ]),
];

List<Word> get allWords => decks.expand((d) => d.words).toList();