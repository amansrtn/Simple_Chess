// ignore_for_file: use_build_context_synchronously
import "package:flutter/material.dart";
import "package:integrate/pages/my_routes.dart";

// import "drawer_page.dart";

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
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "CHESS",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/home_image.jpg"),
                fit: BoxFit.cover)),
        child: Center(
            child: InkWell(
                onTap: () async {
                  setState(() {
                    istap = true;
                  });
                  await Future.delayed(const Duration(seconds: 1));
                  await Navigator.pushNamed(context, MyRoutes.gamepage);
                  setState(() {
                    istap = false;
                  });
                },
                child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: 70,
                    width: istap ? 70 : 200,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(28, 0, 0, 0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(70),
                      ),
                    ),
                    child: Center(
                        child: istap
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "PLAY NOW",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ))))),
      ),
      // drawer: const MyDrawer(),
    );
  }
}
