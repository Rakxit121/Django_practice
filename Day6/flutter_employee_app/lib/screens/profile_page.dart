import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<dynamic> _data = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/colors?page=1'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        _data = jsonResponse['data'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      _showError('Failed to load data');
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Profile Image and Details Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/profile_placeholder.png'),
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt,
                                  color: Colors.blue),
                              onPressed: () {
                                // Handle profile picture update
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'John Doe', // Replace with dynamic data if available
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Software Engineer', // Replace with dynamic data if available
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const Text(
                          'Level: Senior', // Replace with dynamic data if available
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // Settings and Edit Profile Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle settings navigation
                          },
                          child: const Text('Settings'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle edit profile navigation
                          },
                          child: const Text('Edit Profile'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 20),

                  // List of Items from API
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Favorite Colors',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      final item = _data[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(int.parse(
                                  item['color'].substring(1, 7),
                                  radix: 16) +
                              0xFF000000),
                        ),
                        title: Text(item['name']),
                        subtitle: Text(
                            'Year: ${item['year']}, Pantone: ${item['pantone_value']}'),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
