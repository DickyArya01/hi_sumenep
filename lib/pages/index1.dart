import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';

class User {
  final String? name;
  final String? avatar;
  User({this.name, this.avatar});
}

List<User> userList = [
  User(name: "Jon", avatar: ""),
  User(name: "Lindsey ", avatar: ""),
  User(name: "Valarie ", avatar: ""),
  User(name: "Elyse ", avatar: ""),
  User(name: "Ethel ", avatar: ""),
  User(name: "Emelyan ", avatar: ""),
  User(name: "Catherine ", avatar: ""),
  User(name: "Stepanida  ", avatar: ""),
  User(name: "Carolina ", avatar: ""),
  User(name: "Nail  ", avatar: ""),
  User(name: "Kamil ", avatar: ""),
  User(name: "Mariana ", avatar: ""),
  User(name: "Katerina ", avatar: ""),
];

class IndexPage1 extends StatefulWidget {
  const IndexPage1({Key? key}) : super(key: key);

  @override
  State<IndexPage1> createState() => _IndexPage1State();
}

class _IndexPage1State extends State<IndexPage1> {
  List<User> selectedUserList = [];

  void openFilterDialog() async {
    await FilterListDialog.display<User>(
      context,
      listData: userList,
      selectedListData: selectedUserList,
      headlineText: "Filter",
      choiceChipLabel: (user) => user!.name,
      headerCloseIcon: const Icon(Icons.abc),
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (user, query) {
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openFilterDialog,
        child: Icon(Icons.add),
      ),
      body: selectedUserList == null || selectedUserList.length == 0
          ? Center(child: Text('No user selected'))
          : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(selectedUserList[index].name!),
                );
              },
              itemCount: selectedUserList.length,
            ),
    );
  }
}
