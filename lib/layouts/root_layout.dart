import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store/widgets/shared/appbar_widget.dart';
import 'package:store/widgets/shared/drawer_widget.dart';

class RootLayout extends StatelessWidget {
  final Widget screen;

  const RootLayout({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Accueil'),
              onTap: () => context.goNamed('home'),
            ),
            ListTile(
              title: const Text('Catégories'),
              onTap: () => context.goNamed('category'),
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () => context.goNamed('login'),
            ),
          ],
        ),
      ),
      body: screen,
    );
  }
}
