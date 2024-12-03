import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NEWS",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: const Column(
          children: [
            Text("Hottest News"),
            Text(
              "See All", 
              style: Theme.of(context).textTheme.labelSmall,)

          ],
        ),
      ),
    );
  }
}
