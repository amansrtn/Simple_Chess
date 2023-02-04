import "package:flutter/material.dart";

import "drawer_page.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static bool istap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Integrate",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: InkWell(
              onTap: () async {
                setState(() {
                  istap = true;
                });
                await Future.delayed(const Duration(milliseconds: 1800));
                setState(() {
                  istap = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 60,
                width: istap ? 60 : 200,
                decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 10, 40, 92),
                  color: Color.fromARGB(255, 58, 163, 62),
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                child: Center(
                    child: istap
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : const Text(
                            "PREDICT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )),
              ))),
      drawer: const MyDrawer(),
    );
  }
}
