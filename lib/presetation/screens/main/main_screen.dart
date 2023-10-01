import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/presetation/screens/home/home_screen.dart';
import 'package:wallpaper/presetation/screens/saved/saved_screen.dart';
import 'package:wallpaper/utils/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [const HomeScreen(), const SavedScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: hg(context) * 0.07,
        color: Colors.blue.withOpacity(0.2),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            elevation: 24,
            backgroundColor: Colors.blue,
            // selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.blue),
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    color: _selectedIndex == 0
                        ? Colors.black.withOpacity(0.6)
                        : Colors.white.withOpacity(0.6),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.heart_broken_rounded,
                    color: _selectedIndex == 1
                        ? Colors.black.withOpacity(0.6)
                        : Colors.white.withOpacity(0.6),
                  ),
                  label: ""),
            ],
          ),
        ),
      ),
    );
  }
}
