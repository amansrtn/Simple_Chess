import "package:flutter/material.dart";
import "package:flutter_chess_board/flutter_chess_board.dart";

class Chess extends StatefulWidget {
  const Chess({super.key});

  @override
  State<Chess> createState() => _ChessState();
}

class _ChessState extends State<Chess> {
  ChessBoardController controller = ChessBoardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "PLAYGROUND",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
        ),
        body: Container(
          color: Colors.black,
          child: Column(children: [
            Expanded(
              child: Center(
                child: ChessBoard(
                  controller: controller,
                  boardColor: BoardColor.green,
                  boardOrientation: PlayerColor.white,
                ),
              ),
            )
          ]),
        ));
  }
}
