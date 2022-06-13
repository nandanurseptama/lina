import 'package:flutter/material.dart';
import 'package:lina/login/style/color.dart';

class BottomNavigationWidget extends StatelessWidget {
  final void Function(int index) onTapNavigationItem;
  final int currentIndex;
  const BottomNavigationWidget({ Key? key,required this.currentIndex, required this.onTapNavigationItem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(LoginRegisterColor.primaryColor),
      currentIndex: currentIndex,
      selectedItemColor: const Color(LoginRegisterColor.primaryFontColor),
      unselectedItemColor: const Color(LoginRegisterColor.secondaryButtonColor),
      onTap: onTapNavigationItem,
      elevation: 1,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Like"
        ),
      ],
    );
  }
}