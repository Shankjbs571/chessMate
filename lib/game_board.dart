import 'package:flutter/material.dart';
import 'components/square.dart';
import 'helper/helper_methods.dart';

class Gameboard extends StatefulWidget {
  const Gameboard({super.key});

  @override
  State<Gameboard> createState() => _GameboardState();
}

class _GameboardState extends State<Gameboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: GridView.builder(
            itemCount: 8 * 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8),
            itemBuilder: (context, index) {
              return Square(isWhite: isWhite(index));
            },
          ),
        ),
      ),
    );
  }
}
