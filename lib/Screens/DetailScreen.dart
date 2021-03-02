import 'package:flutter/material.dart';
import 'package:frakton_demo_app/Model/UserModel.dart';

class DetailPage extends StatefulWidget {

  final User user;

  DetailPage(this.user);


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User profile details'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black.withOpacity(0.1),
          padding: EdgeInsets.all(40),
          alignment: Alignment.center,
          child: Card (
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
            ),
            elevation: 0,
            color:Colors.white,

            child: Column(
              mainAxisSize: MainAxisSize.max,
              children:<Widget> [
                SizedBox(height: 50),
                InteractiveViewer(

                  child: Container(
                    child: InteractiveViewer(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(widget.user.avatar)

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),

                Center(
                  child: Column(
                      children: [
                        Text(
                          widget.user.firstName + " " + widget.user.lastName,
                          style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(widget.user.email,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 80),
                        Container(
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,

                            children:[
                              RaisedButton(
                                onPressed:(){
                                },
                                child: Text("Previous"),
                                textColor: Colors.white,
                                color: Colors.black,
                                padding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),

                                ),
                              ),
                              MaterialButton(
                                onPressed:(){

                                },
                                child: Text(" Next "),
                                textColor: Colors.white,
                                color: Colors.black,
                                padding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),],

                          ),
                        ),
                      ]),
                ),],
            ),
          ),
        )
    );
  }
}
