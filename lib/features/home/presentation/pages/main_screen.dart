import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/naviagtion_provider.dart';
import '../widgets/custom_bottom_nav.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();

    final pages = [
      const Center(child: Text("Home", style: TextStyle(color: Colors.white))),
      const Center(child: Text("Challenges", style: TextStyle(color: Colors.white))),
      const Center(child: Text("Rewards", style: TextStyle(color: Colors.white))),
      const Center(child: Text("Settings", style: TextStyle(color: Colors.white))),
    ];

    return Scaffold(
      backgroundColor: Colors.black,

      body: pages[provider.currentIndex],

      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}