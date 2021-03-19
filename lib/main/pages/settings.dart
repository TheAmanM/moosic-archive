import 'package:flutter/material.dart';
import 'package:moosic/main/constants.dart';

class Settings extends StatelessWidget {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          customAppBar(
            context,
            'Settings',
          ),
          Padding(
            padding: EdgeInsets.all(mediumPadding),
            child: TextField(
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              controller: nameController,
              cursorColor: mainColor,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Colors.black45,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: mainColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: mainColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.check,
                    color: mainColor,
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(mediumPadding),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              controller: emailController,
              cursorColor: mainColor,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.black45,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: mainColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: mainColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.check,
                    color: mainColor,
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
