// ignore_for_file: avoid_print
import "package:assets_audio_player/assets_audio_player.dart";
import "package:flutter/material.dart";
import "package:flutter_chess_board/flutter_chess_board.dart";
import "package:integrate/pages/my_routes.dart";

class Chess extends StatefulWidget {
  const Chess({super.key});

  @override
  State<Chess> createState() => _ChessState();
}

bool isend = false;
bool p1 = false;
bool p2 = false;
String q = "check";
int size = 0;
int time = 0;

class _ChessState extends State<Chess> {
  ChessBoardController controller = ChessBoardController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.isCheckMate() == true) {
        setState(() {
          isend = true;
          if (time == 0) {
            p1 = false;
            p2 = true;
          } else {
            p2 = false;
            p1 = true;
          }
        });
      } else {
        if (size == controller.getMoveCount()) {
          time = 0;
        } else {
          size = controller.getMoveCount();
          time = 1;
        }
      }
      if (controller.isInCheck() ||
          controller.isCheckMate() ||
          controller.isDraw() ||
          controller.isThreefoldRepetition() ||
          controller.isStaleMate()) {
        AssetsAudioPlayer.newPlayer().open(
          Audio("assets/check.wav"),
          playSpeed: 3,
          autoStart: true,
        );
      } else {
        AssetsAudioPlayer.newPlayer()
            .open(Audio("assets/move.wav"), autoStart: true, playSpeed: 1.8);
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
                                    fontWeight: FontWeight.bold, fontSize: 15))
                            : const Text(
                                "PLAYER 2",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
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
                                    fontWeight: FontWeight.bold, fontSize: 15))
                            : const Text(
                                "PLAYER 1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
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
            p1 = false;
            p2 = false;
            Navigator.pushNamed(context, MyRoutes.gamepage);
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
      ),
    );
  }
}
