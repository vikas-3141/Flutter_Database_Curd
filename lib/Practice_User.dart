import 'package:flutter/material.dart';
import 'package:train/Api_Exicuter.dart';
import 'package:train/Practice_Insert.dart';
import 'package:train/db/PracticeDatabase.dart';

class Practice_User extends StatefulWidget {
  @override
  State<Practice_User> createState() => _Practice_UserState();
}

class _Practice_UserState extends State<Practice_User> {
  Api_Executor db=Api_Executor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Curd"),actions: [
        IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Practice_Insert();
              },)).then((value)
              {
                setState(() {

                });
              });
        }, icon: Icon(Icons.add))
      ],),
      body:
                FutureBuilder(future: db.getApi(), builder: (context, snapshot) {
                        if(snapshot.hasData)
                          {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                  return Card(
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return Practice_Insert(map: snapshot.data![index],);
                                        },)).then((value){
                                          setState(() {

                                          });
                                        });
                                      },
                                        title: Text(snapshot.data![index]['UserName']),
                                      trailing: IconButton(onPressed: () {
                                        db.delete(snapshot.data![index]['id']).then((value)
                                        {
                                          setState(() {

                                          });
                                        });
                                      }, icon: Icon(Icons.delete)),
                                    ),);
                            },);
                          }
                        else if (snapshot.hasError)
                        {
                          return Text(snapshot.error.toString());
                        }
                        else
                          {
                            return CircularProgressIndicator();
                          }
                }
      ,)
    );
  }
}
