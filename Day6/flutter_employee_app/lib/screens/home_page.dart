import 'package:flutter/material.dart';
import 'package:flutter_employee_app/screens/employee_list_screen.dart';
import 'package:flutter_employee_app/screens/profile_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Define the list of pages corresponding to the bottom nav
  static final List<Widget> _widgetOptions = <Widget>[
    const EmployeeListScreen(),
    // const AddEmployeeScreen(),
    const ProfilePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr), // Localized title
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (String value) {
              if (value == 'English') {
                Get.updateLocale(const Locale('en', 'US'));
              } else if (value == 'Nepali') {
                Get.updateLocale(const Locale('np'));
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'English',
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: 'Nepali',
                child: Text('नेपाली'),
              ),
            ],
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // Switches between pages
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'employee_list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'add_employee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Dummy pages for Employee List, Add Employee, and Profile
// class EmployeeListPage extends StatelessWidget {
//   const EmployeeListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Employee List Page'),
//     );
//   }
// }
