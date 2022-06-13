import 'package:flutter/material.dart';
import 'package:lina/home/home_screen.dart';
import 'package:lina/home/widget/bottom_navigation_widget.dart';
import 'package:lina/login/style/color.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(LoginRegisterColor.secondaryButtonColor),
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: currentIndex,
        onTapNavigationItem: (index) {
          setState(() {
            currentIndex = index;
            tabController.index = index;
          });
        },
      ),
      body: TabBarView(
        controller: tabController,
        children: [const HomeScreen(), Container(), Container()],
      ),
    );
  }
}
