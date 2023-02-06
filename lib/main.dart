import "package:flutter/material.dart";
import "package:integrate/pages/chess_page.dart";
import "package:integrate/pages/home_page.dart";
import "package:integrate/pages/my_routes.dart";

void main() {
  runApp(const Mytry());
}

class Mytry extends StatelessWidget {
  const Mytry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black, size: 30),
          ),
        ),
        theme: ThemeData(
            primaryColor: Colors.greenAccent,
            primarySwatch: Colors.deepPurple,
            appBarTheme: const AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.deepPurple,
              iconTheme: IconThemeData(color: Colors.white, size: 30),
            )),
        debugShowCheckedModeBanner: false,
        home: const Home(),
        initialRoute: MyRoutes.gamepage,
        routes: {MyRoutes.gamepage: (context) => const Chess()});
  }
}
