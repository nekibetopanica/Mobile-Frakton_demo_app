
import 'package:flutter/material.dart';
import 'package:frakton_demo_app/Model/UserModel.dart';
import 'package:frakton_demo_app/Screens/DetailScreen.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future<List<User>> _getUsers() async {

    var data = await http.get("https://reqres.in/api/users?per_page=12");

    var jsonData = json.decode(data.body)['data'];

    List<User> users = [];

    for(var i in jsonData){
      User user = User(i["id"],i["avatar"], i["first_name"], i["last_name"], i["email"],);

      users.add(user);

    }

    print(users);
    return users;

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                    child: Center(
                        child: Text("Loading...")
                    )
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              snapshot.data[index].avatar,
                            ),
                          ),
                          title: Row(
                            children: [
                              Text(snapshot.data[index].firstName + " " + snapshot.data[index].lastName),

                            ],
                          ),
                          onTap: () {
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) =>
                                    DetailPage(snapshot.data[index],
                                    )
                                ));
                          }),
                    );

                  },
                );
              }
            }),
      ),
    );
  }
}