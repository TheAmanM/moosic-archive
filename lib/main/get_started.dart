import 'package:flutter/material.dart';
import 'package:moosic/main/constants.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customPadding(
              smallPadding,
              0,
              Text(
                'Moosic',
                style: headline1,
                textAlign: TextAlign.center,
              ),
            ),
            customPadding(
              smallPadding,
              0,
              Text(
                "The only music player you'll ever need",
                style: headline2,
                textAlign: TextAlign.center,
              ),
            ),
            customPadding(
              mediumPadding,
              0,
              /* FlatButton(
                  color: mainColor,
                  onPressed: () {},
                  child: Text(
                    'GET STARTED',
                    textAlign: TextAlign.center,
                  ),
                ), */
              roundedButton(
                () {},
                "GET STARTED",
                mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
