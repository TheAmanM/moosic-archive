import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moosic/main/constants.dart';
import 'package:moosic/main/pages/home.dart';
import 'package:moosic/main/pages/playlists.dart';
import 'package:moosic/main/pages/settings.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int pageIndex = 0;

  String name = "Aman";
  String email = "moo.testing@gmail.com";

  Widget getColorTile(bool isSelected, String text, IconData icon, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(pageIndex);
        if (pageIndex != index) {
          Navigator.pop(context);
          setState(() {
            pageIndex = index;
          });
        }
        print(pageIndex);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // if (isSelected)
          GestureDetector(
            onTap: () {
              if (pageIndex != index) {
                Navigator.pop(context);
                setState(() {
                  pageIndex = index;
                });
              }
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: smallPadding,
              ),
              child: Container(
                child: ListTile(),
                decoration: BoxDecoration(
                  color: isSelected ? mainColor : Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(1000),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mediumPadding,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(icon, color: isSelected ? Colors.white : Colors.black),
                  onPressed: null,
                  color: isSelected ? Colors.white : Colors.black,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* bottomNavigationBar: Container(
        color: Colors.lime,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Scaffold(
                    resizeToAvoidBottomPadding: false,
                    backgroundColor: Colors.white,
                    body: Hero(
                      tag: 'SongTile',
                      child: Container(
                        color: Colors.lime,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: MaterialApp(
            home: Hero(
              tag: 'SongTile',
              child: ListTile(),
            ),
          ),
        ),
      ), */
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: drawerItems[pageIndex].page ?? Container(),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: mainColor,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    name[0].toUpperCase(),
                    style: TextStyle(
                      color: mainColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                accountName: Text(
                  name ?? '',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                accountEmail: Text(
                  email ?? '',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (b) {
                    b.disallowGlow();
                  },
                  child: ListView.builder(
                    // physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: drawerItems.length,
                    itemBuilder: ((context, int index) {
                      DrawerItem item = drawerItems[index];
                      bool isEmpty = item.isEmptyLine;

                      Container colorContainer(bool isLeft, Widget child) {
                        return Container(
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.horizontal(
                              left: isLeft ? Radius.circular(1000) : Radius.circular(0),
                              right: isLeft ? Radius.circular(0) : Radius.circular(1000),
                            ),
                          ),
                          child: child,
                        );
                      }

                      if (!isEmpty) {
                        Icon icon = new Icon(
                          item.icon,
                          color: Colors.black,
                        );

                        Text text = new Text(
                          item.name,
                          style: TextStyle(
                            color: pageIndex == index ? Colors.white : Colors.black,
                          ),
                        );

                        /* return ListTile(
                            leading: pageIndex == index ? colorContainer(true, icon) : icon,
                            title: pageIndex == index ? colorContainer(false, text) : text,
                            onTap: () {
                              // newPage(context, item.page);
                              Navigator.pop(context);
                              if (pageIndex != index) {
                                setState(() {
                                  pageIndex = index;
                                });
                              }
                            },
                          ); */
                        // return ColorTile(
                        //   icon: item.icon,
                        //   text: item.name,
                        //   page: item.page,
                        //   isSelected: pageIndex == index,
                        // );
                        return getColorTile(
                          pageIndex == index,
                          item.name,
                          item.icon,
                          index,
                          context,
                        );
                      } else {
                        return customPadding(
                          smallPadding,
                          0,
                          Divider(
                            color: Colors.black,
                            thickness: 0.5,
                            indent: 20,
                            endIndent: 20,
                          ),
                        );
                      }
                    }),
                  ),
                ),
              ),
              /* Container(
                color: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.copyright,
                  ),
                  onPressed: () {},
                ),
               ),
              */
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem {
  bool isEmptyLine;
  IconData icon;
  String name;
  Widget page;

  DrawerItem({
    this.isEmptyLine,
    this.icon,
    this.name,
    this.page,
  });
}

List<DrawerItem> drawerItems = <DrawerItem>[
  DrawerItem(
    isEmptyLine: false,
    icon: Icons.home,
    name: 'Home',
    page: Home(),
  ),
  DrawerItem(
    isEmptyLine: false,
    icon: Icons.playlist_play,
    name: 'Playlists',
    page: Playlists(),
  ),
  DrawerItem(
    isEmptyLine: false,
    icon: Icons.cached,
    name: 'Recents',
    page: null,
  ),
  DrawerItem(
    isEmptyLine: true,
  ),
  DrawerItem(
    isEmptyLine: false,
    name: 'YouTube to MP3',
    icon: FontAwesomeIcons.youtube,
    page: null,
  ),
  DrawerItem(
    isEmptyLine: false,
    name: 'Lyrics',
    icon: Icons.text_format,
    page: null,
  ),
  DrawerItem(
    isEmptyLine: false,
    name: 'Find a song',
    icon: Icons.search,
    page: null,
  ),
  DrawerItem(
    isEmptyLine: false,
    name: 'File Manager',
    icon: Icons.file_copy,
    page: null,
  ),
  DrawerItem(
    isEmptyLine: true,
  ),
  DrawerItem(
    isEmptyLine: false,
    name: 'Settings',
    icon: Icons.settings,
    page: Settings(),
  ),
  DrawerItem(
    isEmptyLine: false,
    name: 'About',
    icon: FontAwesomeIcons.copyright,
    page: null,
  ),
  DrawerItem(
    isEmptyLine: false,
    name: 'Help & Feedback',
    // icon: Icons.help_outline,
    icon: FontAwesomeIcons.question,
    page: null,
  ),
];

/*
home
playlists
recents
-------------
Youtube to MP3
Name a song (Shazam)
Find a song (LastFM)

settings
// help and feedback

*/
