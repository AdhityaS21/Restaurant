import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Navigation with ChangeNotifier{
  int _currentIndex = 0;
  bool _favorite;
  bool _selectedIndex1 = true;
  bool _selectedIndex2 = false;
  bool _selectedIndex3 = false;
  bool _selectedIndex4 = false;

  int get currentIndex => _currentIndex;
  bool get favorite => _favorite;
  bool get selectedIndex1 => _selectedIndex1;
  bool get selectedIndex2 => _selectedIndex2;
  bool get selectedIndex3 => _selectedIndex3;
  bool get selectedIndex4 => _selectedIndex4;

  set currentIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

  set favorite(bool value){
    _favorite = value;
    notifyListeners();
  }

  set selectedIndex1(bool val){
    _selectedIndex1 = val;
    notifyListeners();
  }

  set selectedIndex2(bool val){
    _selectedIndex2 = val;
    notifyListeners();
  }

  set selectedIndex3(bool val){
    _selectedIndex3 = val;
    notifyListeners();
  }

  set selectedIndex4(bool val){
    _selectedIndex4 = val;
    notifyListeners();
  }

  IconData get icon => (_favorite) ? Icons.favorite : Icons.favorite_border;

  // Color get color => (_selectedIndex[_currentIndex]) ? Colors.blue : Colors.grey;
}