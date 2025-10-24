import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/user_model.dart';
import 'package:couldai_user_app/widgets/user_card.dart';
import 'package:couldai_user_app/screens/matches_screen.dart';
import 'package:couldai_user_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<User> _users = [
    User(
      id: 1,
      name: 'Alice',
      age: 25,
      bio: 'Lover of dogs, coffee, and spontaneous adventures. Looking for someone to explore the city with!',
      imageUrls: [
        'https://images.unsplash.com/photo-1520466809213-7b9a56adcd45?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
    ),
    User(
      id: 2,
      name: 'Bob',
      age: 28,
      bio: 'Software engineer by day, aspiring chef by night. My dog thinks I\'m pretty cool. Let\'s grab a drink!',
      imageUrls: [
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ],
    ),
    User(
      id: 3,
      name: 'Clara',
      age: 23,
      bio: 'Art student who loves hiking and painting. Let\'s create something beautiful together.',
      imageUrls: [
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ],
    ),
  ];

  void _nextUser() {
    setState(() {
      if (_currentIndex < _users.length - 1) {
        _currentIndex++;
      } else {
        // End of list, show a message or loop
         _currentIndex = 0; // Loop for now
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MatchesScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _users.isNotEmpty
                  ? UserCard(user: _users[_currentIndex])
                  : const Center(child: Text('No more profiles')),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _nextUser,
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.close, color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: _nextUser,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.favorite, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
