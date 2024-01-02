import 'package:chessmate/components/pieces.dart';
import 'package:flutter/material.dart';
import 'components/square.dart';
import 'helper/helper_methods.dart';

class Gameboard extends StatefulWidget {
  const Gameboard({super.key});

  @override
  State<Gameboard> createState() => _GameboardState();
}

class _GameboardState extends State<Gameboard> {
  late List<List<ChessPiece?>> board;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    List<List<ChessPiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));

    //place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
        type: ChessPieceType.pawn,
        isWhite: false,
        imagePath: './lib/images/black-pawn.png',
      );

      newBoard[6][i] = ChessPiece(
        type: ChessPieceType.pawn,
        isWhite: true,
        imagePath: './lib/images/black-pawn.png',
      );
    }
    //place rooks
    newBoard[0][0] = ChessPiece(
      type: ChessPieceType.rook,
      isWhite: false,
      imagePath: './lib/images/black-rook.png',
    );
    newBoard[0][7] = ChessPiece(
      type: ChessPieceType.rook,
      isWhite: false,
      imagePath: './lib/images/black-rook.png',
    );
    newBoard[7][0] = ChessPiece(
      type: ChessPieceType.rook,
      isWhite: true,
      imagePath: './lib/images/black-rook.png',
    );
    newBoard[7][7] = ChessPiece(
      type: ChessPieceType.rook,
      isWhite: true,
      imagePath: './lib/images/black-rook.png',
    );
    //knights
    newBoard[0][1] = ChessPiece(
      type: ChessPieceType.knight,
      isWhite: false,
      imagePath: './lib/images/black-knight.png',
    );
    newBoard[0][6] = ChessPiece(
      type: ChessPieceType.knight,
      isWhite: false,
      imagePath: './lib/images/black-knight.png',
    );
    newBoard[7][1] = ChessPiece(
      type: ChessPieceType.knight,
      isWhite: true,
      imagePath: './lib/images/black-knight.png',
    );
    newBoard[7][6] = ChessPiece(
      type: ChessPieceType.knight,
      isWhite: true,
      imagePath: './lib/images/black-knight.png',
    );
    //bishops
    newBoard[0][2] = ChessPiece(
      type: ChessPieceType.bishop,
      isWhite: false,
      imagePath: './lib/images/black-bishop.png',
    );
    newBoard[0][5] = ChessPiece(
      type: ChessPieceType.knight,
      isWhite: false,
      imagePath: './lib/images/black-bishop.png',
    );
    newBoard[7][2] = ChessPiece(
      type: ChessPieceType.bishop,
      isWhite: true,
      imagePath: './lib/images/black-bishop.png',
    );
    newBoard[7][5] = ChessPiece(
      type: ChessPieceType.bishop,
      isWhite: true,
      imagePath: './lib/images/black-bishop.png',
    );
    //king
    newBoard[0][3] = ChessPiece(
      type: ChessPieceType.king,
      isWhite: false,
      imagePath: './lib/images/black-king.png',
    );
    newBoard[7][4] = ChessPiece(
      type: ChessPieceType.king,
      isWhite: true,
      imagePath: './lib/images/black-king.png',
    );
    //queen
    newBoard[0][4] = ChessPiece(
      type: ChessPieceType.queen,
      isWhite: false,
      imagePath: './lib/images/black-queen.png',
    );
    newBoard[7][3] = ChessPiece(
      type: ChessPieceType.queen,
      isWhite: true,
      imagePath: './lib/images/black-queen.png',
    );
    board = newBoard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 220, 114),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 10,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          height: 400,
          width: 400,
          child: GridView.builder(
            itemCount: 8 * 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8),
            itemBuilder: (context, index) {
              int row = index ~/ 8;
              int col = index % 8;

              return Square(
                isWhite: isWhite(index),
                piece: board[row][col],
              );
            },
          ),
        ),
      ),
    );
  }
}
