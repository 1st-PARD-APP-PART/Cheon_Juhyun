import 'Home.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'mydang.dart';

class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    myDang(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              _currentIndex = 1;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _currentIndex == 0 ? Colors.black : Colors.grey),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined,
                color: _currentIndex == 1 ? Colors.black : Colors.grey),
            label: '나의 당근',
          ),
        ],

        selectedItemColor: Colors.black, // 선택된 아이템 텍스트 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 텍스트 색상
      ),
    );
  }
}
