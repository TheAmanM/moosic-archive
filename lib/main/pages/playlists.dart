import 'package:flutter/material.dart';
import './../constants.dart';

class Playlists extends StatelessWidget {
  Future<List> getPlaylists() async {
    print('Starting');
    await Future.delayed(
      Duration(
        // seconds: 3,
        milliseconds: 1500,
      ),
    );
    print('Done!');
    return [];
  }

  void showNewPlaylistSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* persistentFooterButtons: [
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.arrow_left,
            color: mainColor,
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: mainColor,
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.pause,
                  color: mainColor,
                ),
              ),
            ],
          ),
        )
      ], */
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      appBar: customAppBar(
        context,
        'Playlists',
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
        ],
      ),
      body: FutureBuilder(
        future: getPlaylists(),
        builder: (context, AsyncSnapshot<List> future) {
          if (future.hasData) {
            if (future.data.isEmpty) {
              return Center(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /* Image.asset(
                            'assets/worried.png',
                            height: MediaQuery.of(context).size.width * 0.6,
                            width: MediaQuery.of(context).size.width * 0.6,
                          ), */
                      Image(
                        image: AssetImage(
                          'assets/Sad-Face.png',
                        ),
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.width * 0.6,
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      SizedBox(height: 32),
                      Text(
                        'Dang, looks like you have no playlists!',
                      ),
                      SizedBox(
                        height: smallPadding,
                      ),
                      roundedButton(
                        () => showNewPlaylistSheet(context),
                        'CREATE ONE HERE',
                        mainColor,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          } else {
            return Spinner();
          }
        },
      ),
    );
  }
}
