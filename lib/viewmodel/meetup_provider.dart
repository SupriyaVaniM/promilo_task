import 'package:flutter/material.dart';

class MeetupProvider with ChangeNotifier {
  int _currentIndex = 0;
  final List<String> _images = [
    'image1.jpg',
    'image2.jpg',
    'image3.jpg',
  ];

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<String> get images => _images;
}
