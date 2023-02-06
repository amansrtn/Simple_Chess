// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import "package:flutter_chess_board/flutter_chess_board.dart";
// import "package:integrate/pages/drawer_page.dart";

class Chess extends StatefulWidget {
  const Chess({super.key});

  @override
  State<Chess> createState() => _ChessState();
}

bool isend = false;
int size = 1;
bool p1 = false;
bool p2 = false;

class _ChessState extends State<Chess> {
  ChessBoardController controller = ChessBoardController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.isCheckMate() == false) {
        size++;
      }
      if (controller.isCheckMate() == true) {
        setState(() {
          isend = true;
          if (size % 2 == 0) {
            setState(() {
              p2 = true;
              p1 = false;
            });
          } else {
            p1 = true;
            p2 = false;
          }
        });
      }
    });
  }

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
            child: Center(
                child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: p2
                          ? const Text("WINNER!!!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15))
                          : p1
                              ? const Text("LOSER!!!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15))
                              : const Text(
                                  "PLAYER 2",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )),
                ),
                const SizedBox(height: 70),
                Card(
                    child: ChessBoard(
                  controller: controller,
                  boardColor: BoardColor.green,
                  boardOrientation: PlayerColor.white,
                )),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: p1
                          ? const Text(
                              "WINNER!!!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          : p2
                              ? const Text("LOSER!!!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15))
                              : const Text(
                                  "PLAYER 1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ))),
        floatingActionButton: InkWell(
          onTap: () {
            setState(() {
              isend = false;
              size = 0;
              p1 = false;
              p2 = false;
              controller.resetBoard();
            });
          },
          child: Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
                child: Text(
              "Restart?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )),
          ),
        ));
  }
}
