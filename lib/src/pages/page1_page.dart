import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/src/pages/twitter_page.dart';
import '/src/pages/navigation_page.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: const Text('Animate'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TwitterPage()),
              );
            },
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const Page1()),
              );
            },
            icon: SlideInLeft(
              from: 100,
              child: const FaIcon(FontAwesomeIcons.chevronRight),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Icon(Icons.new_releases, color: Colors.blue, size: 40),
            ElasticIn(
              delay: const Duration(milliseconds: 1100),
              child: Icon(Icons.new_releases, color: theme.primary, size: 40),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              child: const Text(
                'Title',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text(
                "I'm a small text",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            // Container(width: 220, height: 2, color: Colors.blue),
            FadeInLeft(
              delay: const Duration(milliseconds: 1100),
              child: Container(width: 220, height: 2, color: theme.primary),
            ),
          ],
        ),
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationPage()),
            );
          },
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
    );
  }
}
