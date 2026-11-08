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
  Deck('Màu sắc', 'Colors', Icons.palette, [
    Word('red', '/red/', 'màu đỏ', 'She wears a red dress.'),
    Word('blue', '/bluː/', 'màu xanh dương', 'The sky is blue today.'),
    Word('green', '/ɡriːn/', 'màu xanh lá', 'I like green tea.'),
    Word('yellow', '/ˈjeloʊ/', 'màu vàng', 'The banana is yellow.'),
    Word('black', '/blæk/', 'màu đen', 'My cat is black.'),
    Word('white', '/waɪt/', 'màu trắng', 'The wall is white.'),
    Word('pink', '/pɪŋk/', 'màu hồng', 'She has a pink bag.'),
    Word('orange', '/ˈɔːrɪndʒ/', 'màu cam', 'The sunset is orange.'),
  ]),
  Deck('Món ăn', 'Food', Icons.restaurant, [
    Word('rice', '/raɪs/', 'cơm/gạo', 'We eat rice every day.'),
    Word('noodles', '/ˈnuːdlz/', 'mì/bún/phở', 'I have noodles for lunch.'),
    Word('bread', '/bred/', 'bánh mì', 'He buys fresh bread in the morning.'),
    Word('egg', '/eɡ/', 'quả trứng', 'I eat an egg for breakfast.'),
    Word('chicken', '/ˈtʃɪkɪn/', 'thịt gà', 'Fried chicken is delicious.'),
    Word('fish', '/fɪʃ/', 'cá', 'My mother cooks fish with tomatoes.'),
    Word('soup', '/suːp/', 'món súp/canh', 'This soup is hot.'),
    Word('fruit', '/fruːt/', 'trái cây', 'I eat fruit after dinner.'),
  ]),
  Deck('Đồ uống', 'Drinks', Icons.local_cafe, [
    Word('water', '/ˈwɔːtər/', 'nước', 'Please drink more water.'),
    Word('tea', '/tiː/', 'trà', 'My grandfather drinks tea every morning.'),
    Word('coffee', '/ˈkɔːfi/', 'cà phê', 'I need a cup of coffee.'),
    Word('milk', '/mɪlk/', 'sữa', 'Children should drink milk.'),
    Word('juice', '/dʒuːs/', 'nước ép', 'I would like orange juice.'),
    Word('smoothie', '/ˈsmuːði/', 'sinh tố', 'She makes a mango smoothie.'),
    Word('soda', '/ˈsoʊdə/', 'nước ngọt có ga', 'Soda is not good for your health.'),
    Word('lemonade', '/ˌleməˈneɪd/', 'nước chanh', 'Cold lemonade is perfect in summer.'),
  ]),
  Deck('Thời tiết', 'Weather', Icons.wb_sunny, [
    Word('sunny', '/ˈsʌni/', 'có nắng', 'It is sunny today.'),
    Word('rainy', '/ˈreɪni/', 'có mưa', 'It is a rainy day.'),
    Word('cloudy', '/ˈklaʊdi/', 'nhiều mây', 'The sky is cloudy this morning.'),
    Word('windy', '/ˈwɪndi/', 'có gió', 'It is too windy to fly a kite.'),
    Word('snowy', '/ˈsnoʊi/', 'có tuyết', 'It is snowy in Korea in winter.'),
    Word('storm', '/stɔːrm/', 'cơn bão', 'A big storm is coming.'),
    Word('hot', '/hɑːt/', 'nóng', 'Hanoi is very hot in summer.'),
    Word('cold', '/koʊld/', 'lạnh', 'Wear a coat, it is cold outside.'),
  ]), 
];

List<Word> get allWords => decks.expand((d) => d.words).toList();