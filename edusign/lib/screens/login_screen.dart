import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../language_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myAppState = Provider.of<MyAppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: myAppState.isLoggedIn ? const Text("Yes") : const Text("NO"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => {myAppState.login()},
          ),
          IconButton(
            icon: const Icon(Icons.abc),
            onPressed: () => {myAppState.logout()},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "AppLocalizations.of(context)!.welcomeMessage",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                _buildRoleButton(
                  label: "AppLocalizations.of(context)!.studentRole",
                  icon: Icons.school,
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.pushNamed(context, '/student',
                        arguments: {'username': 'Ansh'});
                  },
                ),
                const SizedBox(height: 20),
                _buildRoleButton(
                  label: "AppLocalizations.of(context)!.parentsRole",
                  icon: Icons.people,
                  color: Colors.pink,
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                _buildRoleButton(
                  label: "AppLocalizations.of(context)!.teacherRole",
                  icon: Icons.person,
                  color: Colors.green,
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                _buildRoleButton(
                  label: "AppLocalizations.of(context)!.hrRole",
                  icon: Icons.business_center,
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
