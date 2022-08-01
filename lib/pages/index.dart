import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/constant.dart';
import 'package:http/http.dart' as http;


class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    print("fetching...");
    var _url = url_user;
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var items = json.decode(response.body)['results'];

      setState(() {
        users = items;
        // print(users);
      });
    } else {
      setState(() {
        users = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  // Widget getBody() {
  // return ListView.builder(
  // itemCount: users.length,
  // itemBuilder: (context, index) {
  // return getCard(users[index]);
  // });
  // }

  Widget getCard(item) {
    var name = item['name']['title'] +
        " " +
        item['name']['first'] +
        " " +
        item['name']['last'];

    var location =
        item['location']['state'] + ", " + item['location']['country'];

    var picture = item['picture']['large'];
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(picture)),
                  borderRadius: BorderRadius.circular(120)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(location)
              ],
            )
          ],
        ),
      ),
    );
  }
}
