import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color mainColor = new Color(0xFF37137f);
Color accentColor = new Color(0xFF292D3E);

Color fadedGrey = new Color(0xFFE1E1E1);

double smallPadding = 8;
double mediumPadding = 16;

TextStyle headline1 = new TextStyle(
  fontSize: 72,
  color: mainColor,
  fontWeight: FontWeight.w200,
);

TextStyle headline2 = new TextStyle(
  fontSize: 20.0,
  color: accentColor,
  fontWeight: FontWeight.w500,
);

TextStyle bodyText1 = new TextStyle(
  fontSize: 14.0,
  color: Colors.black,
);

List addToArray(List list, var item) {
  return [item, ...list];
}

AppBar customAppBar(BuildContext context, String name, [List<Widget> actions]) {
  return AppBar(
    actionsIconTheme: IconThemeData(
      color: mainColor,
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: mainColor,
    ),
    title: Text(
      name,
      style: TextStyle(
        color: mainColor,
      ),
    ),
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      color: mainColor,
    ),
    actions: actions ?? null,
  );
}

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

Widget roundedButton(Function() onTap, String text, Color color) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          1000,
        ),
      ),
    ),
  );
}

Widget customTextField(TextEditingController controller, [IconButton prefixIcon, IconButton suffixIcon]) {
  return TextField(
    controller: controller,
    // keyboardType: TextInputType.numberWithOptions(signed: false),
    textCapitalization: TextCapitalization.none,
    cursorColor: mainColor,
    decoration: InputDecoration(
      labelText: 'Search for a user: ',
      labelStyle: TextStyle(
        color: Colors.black45,
      ),
      prefixIcon: prefixIcon ?? null,
      suffixIcon: suffixIcon ?? null,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mainColor),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mainColor),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
    ),
  );
}

Padding customPadding(double vertical, double horizontal, Widget child) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: vertical.toDouble(),
      horizontal: horizontal.toDouble(),
    ),
    child: child,
  );
}

void newPage(BuildContext context, Widget newPage) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return newPage;
      },
    ),
  );
}

Map sharedPreferences = {
  "accountInfo": {
    "name": "",
    "email": "",
  }, // User data
  "favorites": [], // Favorite songs
  "recents": [], // Recent songs
  "playlists": [], // A list of saved playlists, each playlist itself being a list
  "initialized": false, // Whether to show get started screen or regular screen
  // "lastPage": 0 // Starts app on last opened menu option
};
