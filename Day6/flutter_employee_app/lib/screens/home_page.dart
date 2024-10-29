import 'package:flutter/material.dart';
import 'package:flutter_employee_app/screens/employee_list_screen.dart';
import 'package:flutter_employee_app/screens/health_insurance_form.dart';
import 'package:flutter_employee_app/screens/profile_page.dart';
import 'package:flutter_employee_app/screens/show_records.dart';
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
    const HealthInsuranceForm(),
    ShowRecords(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List locale = [
    {'language': 'English', 'locale': const Locale('en', 'US')},
    {'language': 'Nepali', 'locale': const Locale('np', 'NP')}
  ];

  void updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  void buildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: const Text('Choose Your Language'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Text(locale[index]['language']),
                    onTap: () {
                      updateLanguage(locale[index]['locale']);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr), // Localized title
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              buildDialog(context);
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // Switches between pages
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: 'employee_list'.tr, // Translated label
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add),
            label: 'add_employee'.tr, // Translated label
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.edit_document),
            label: 'show_records'.tr, // Translated label
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'profile'.tr, // Translated label
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
