import 'package:chessmate/components/pieces.dart';
import 'package:flutter/material.dart';
import 'package:chessmate/values/colors.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final void Function()? onTap;

  const Square(
      {super.key,
      required this.isWhite,
      this.piece,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    if (isSelected) {
      squareColor = Color.fromARGB(255, 108, 255, 67);
    } else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }
}
