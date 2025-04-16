import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animate'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.chevronRight),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Icon(Icons.new_releases, color: Colors.blue, size: 40),
            Icon(Icons.new_releases, color: theme.primary, size: 40),
            FadeInDown(
              delay: const Duration(milliseconds: 500),
              child: const Text(
                'Title',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            const Text(
              "I'm a small text",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            // Container(width: 220, height: 2, color: Colors.blue),
            Container(width: 220, height: 2, color: theme.primary),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const FaIcon(FontAwesomeIcons.play),
      ),
    );
  }
}
