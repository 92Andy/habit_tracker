import 'package:flutter/material.dart';
import 'package:habit_tracker/overview/tabs/main_tab_page.dart';
import 'package:habit_tracker/theming/custom_colors.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPage();
}

class _OverviewPage extends State<OverviewPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Menu',
      style: optionStyle,
    ),
    Text(
      'Index 1: Time',
      style: optionStyle,
    ),
    MainTabPage(),
    Text(
      'Index 3: Alarm',
      style: optionStyle,
    ),
    Text(
      'Index 4: Setting',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: CustomColors.surfaceWhite),
        selectedItemColor: CustomColors.surfaceWhite,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.apps_rounded),
            label: 'Menu',
            backgroundColor: CustomColors.azureBlue,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.access_time_rounded),
            label: 'Time',
            backgroundColor: CustomColors.azureBlue,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add),
            label: 'Add',
            backgroundColor: CustomColors.azureBlue,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.alarm),
            label: 'Alarm',
            backgroundColor: CustomColors.azureBlue,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: CustomColors.azureBlue,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        unselectedItemColor: CustomColors.azureBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
