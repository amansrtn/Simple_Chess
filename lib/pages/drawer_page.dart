import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integrate/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.deepPurple),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: Text(
                      "Aman kumar Singh",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                    accountEmail: Text(
                      "aman18may18@gmail.com",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg")))),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListTile(
                    onTap: () {
                      const Home();
                    },
                    leading: const Icon(
                      CupertinoIcons.home,
                      color: Colors.white,
                      size: 45,
                    ),
                    title: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Home",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        )))),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListTile(
                    leading: Icon(
                      CupertinoIcons.alarm,
                      color: Colors.white,
                      size: 45,
                    ),
                    title: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Alarm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        )))),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: ListTile(
                    leading: Icon(
                      CupertinoIcons.battery_25,
                      color: Colors.white,
                      size: 45,
                    ),
                    title: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "My Progress",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        )))),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListTile(
                    onTap: () {
                      // ignore: unused_local_variable
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'aman18may18@gmail.com',
                      );
                      launchUrl(emailLaunchUri);
                    },
                    leading: const Icon(
                      CupertinoIcons.mail,
                      color: Colors.white,
                      size: 45,
                    ),
                    title: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        )))),
          ],
        ),
      ),
    );
  }
}
