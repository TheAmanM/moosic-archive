import 'package:flutter/material.dart';
import 'package:moosic/main/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  Future<http.Response> fetchAPI() async {
    String url = 'https://randomuser.me/api/?results=20';
    var response = await http.get(url);
    // print(response.body);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: customAppBar(
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
      body: FutureBuilder(
        future: fetchAPI(),
        builder: (context, AsyncSnapshot<http.Response> snapshot) {
          if (snapshot.hasData) {
            Map body = json.decode(snapshot.data.body);
            print(body["results"]);
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (t) {
                t.disallowGlow();
              },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                // itemCount: snapshot.data["results"].length,
                itemCount: body["results"].length,
                itemBuilder: (context, int index) {
                  Map obj = body["results"][index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        obj["picture"]["thumbnail"],
                      ),
                    ),
                    title: Text(obj["name"]["first"] + " " + obj["name"]["last"]),
                    subtitle: obj["name"]["first"].toString().length == 6 ? Text("Online") : null,
                  );
                },
              ),
            );
          } else {
            return Center(child: Spinner());
          }
        },
      ),
    );
  }
}
