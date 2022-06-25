import 'package:flutter/material.dart';
import 'package:spaplex/screens/home_screen.dart';
import 'package:spaplex/screens/profile.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _currentIndex = 0;

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const Center(child: Text("Favourite")),
      const Center(child: Text("Cart")),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: Container(
        color: const Color(0xfff4f4f4),
        child: Center(
          child: screens[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          onTap: _onTapped,
          items: const [
            BottomNavigationBarItem(label: ('Home'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: ('Favourite'), icon: Icon(Icons.favorite_outlined)),
            BottomNavigationBarItem(
                label: ('Cart'), icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(
                label: ('Profile'), icon: Icon(Icons.settings)),
          ]),
    );
  }
}
