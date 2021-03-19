import 'package:flutter/material.dart';
import 'package:moosic/main/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        customAppBar(
          context,
          'Home', /* 
          <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: mainColor,
              ),
              onPressed: () {
                showNewPlaylistSheet(context);
              },
            )
          ], */
        ),
        /* customPadding(
          smallPadding,
          mediumPadding,
          customTextField(),
        ), */
      ],
    );
  }
}
