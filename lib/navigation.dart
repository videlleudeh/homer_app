import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/provider/nav_index_provider.dart';

class HomeNav extends ConsumerWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navController = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: pages[navController],
      bottomNavigationBar: NavigationBar(
        labelPadding: EdgeInsets.only(bottom: 5),
        indicatorColor: Theme.of(context).colorScheme.surfaceDim,
        backgroundColor: Colors.white70,
        height: 60,
        selectedIndex: navController,
        onDestinationSelected: (value) =>
            ref.read(bottomNavIndexProvider.notifier).update((state) => value),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Shop",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: "Favorites",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
