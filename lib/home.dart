import 'package:flutter/material.dart';
import 'main.dart';

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade900),
      body:Column(),
      drawer: const NavigationDrawer(),
    );
  }
}
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    shape: Border.all(style: BorderStyle.none),
    backgroundColor: Colors.blue.shade900,
    child: SingleChildScrollView(
      child: Column(
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Container(
    color: Colors.white,
    height: MediaQuery.of(context).size.height * 0.15,
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Row(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/p2.jpg',height:100,),
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Column(
                children: [
                  Text("Where is my Train",style: TextStyle(color: Colors.blue.shade900,fontSize: 20,decorationThickness: 2),),
                ],
              ),
              Text("from Google",),
            ],
          ),
        ),
      ],
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    child: Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.update,
            color: Colors.white,
          ),
          title: const Text("Update Timetable",
              style: TextStyle(color: Colors.white)),
          onTap: () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>  MyApp(),
              )),
        ),
        ListTile(
          leading: const Icon(Icons.language_sharp, color: Colors.white),
          title:
          const Text("Language", style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.location_city, color: Colors.white),
          title: const Text("Change city",
              style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.cancel, color: Colors.white),
          title: const Text("Clear Recent Searches",
              style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.white),
          title:
          const Text("Settings", style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.share, color: Colors.white),
          title: const Text("Share App",
              style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.play_arrow, color: Colors.white),
          title:
          const Text("Rate Us", style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.bug_report, color: Colors.white),
          title: const Text("Report Issue",
              style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Container(child: Divider(color: Colors.black,thickness:0.1,),),
        ListTile(
          leading: const Icon(Icons.inventory, color: Colors.white),
          title:
          const Text("Settings", style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.where_to_vote, color: Colors.white),
          title: const Text("Share in WhatsApp",
              style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
