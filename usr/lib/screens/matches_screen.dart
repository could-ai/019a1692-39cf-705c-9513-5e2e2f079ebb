import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
      ),
      body: ListView.builder(
        itemCount: 8, // Placeholder
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index + 10}'),
            ),
            title: Text('Match ${index + 1}'),
            subtitle: const Text('Tap to chat'),
            onTap: () {
              // Navigate to chat screen
            },
          );
        },
      ),
    );
  }
}
