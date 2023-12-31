import 'package:flutter/material.dart';

class Gameboard extends StatefulWidget {
  const Gameboard({super.key});

  @override
  State<Gameboard> createState() => _GameboardState();
}

class _GameboardState extends State<Gameboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 8 * 8,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              child: Text(
                index.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
