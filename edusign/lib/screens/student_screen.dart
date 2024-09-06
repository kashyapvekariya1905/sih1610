import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../language_provider.dart';

class StudentScreen extends StatefulWidget {
  final String username;
  const StudentScreen({super.key, required this.username});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  getStudent() async {
    final data = {
      "first_name": "data['first_name']",
      "last_name": "data['last_name']",
      "email": "data['email'eq]",
      "password": "data['password']",
      "date_of_birth": "2023-12-12",
      "gender": "data['gender']",
      "address": "data['address']",
      "phone_number": "data['phone_number']",
      "assigned_teacher_id": 1,
      "parent_id": 1
    };
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:1000/add/students'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print('Student uploaded successfully: ${response.body}');
      } else {
        print('Image upload failed: ${response.body}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  getStudentByTeacher() async {
    int id = 1;
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:1000/get/students/by_teacher/$id'),
      );

      if (response.statusCode == 200) {
        print('Student uploaded successfully: ${response.body}');
      } else {
        print('Image upload failed: ${response.body}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final myAppState = Provider.of<MyAppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: myAppState.isLoggedIn ? const Text("gujarati") : const Text("english"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                getStudent();
              },
              child: const Text("Button 1"),
            ),
            ElevatedButton(
              onPressed: () {
                getStudentByTeacher();
              },
              child: const Text("Button 2"),
            ),
          ],
        ),
      ),
    );
  }
}
