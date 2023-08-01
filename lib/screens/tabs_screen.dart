import 'package:flutter/material.dart';
import 'package:shoping/screens/cart_screen.dart';
import 'package:shoping/screens/home_screen.dart';
import 'package:shoping/screens/profile_screen.dart';

class TabsScreen extends StatefulWidget {
   const TabsScreen({Key? key, }) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
   final List<Widget> _tabs = [
     const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
          top: false,
      child: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          fixedColor:Colors.black ,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(

              icon: Icon(Icons.home,color: Colors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black,),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
