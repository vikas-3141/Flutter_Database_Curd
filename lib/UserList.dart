import 'package:flutter/material.dart';
import 'package:train/UserUpdate.dart';
import 'package:train/db/mydatabase.dart';

class UserList extends StatefulWidget {
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  mydatabase db=mydatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black12,title:Text("The DataBase Crud"),actions: [IconButton(onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserUpdate();
        },)).then((value)
        {
          setState(() {

          });
        });
      }, icon: Icon(Icons.add))]),
      body: Container(
        child: FutureBuilder(future: db.copyPasteAssetFileToRoot(),builder: (context, snapshot) {
          if(snapshot.hasData)
            {
              return FutureBuilder(future: db.getUser(), builder: (context, snapshot) {
                if(snapshot.hasData)
                  {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder:(context, index) {
                          return ListTile(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return UserUpdate(map: snapshot.data![index],);
                            },)).then((value)
                            {
                              setState(() {

                              });
                            });
                          },
                          title: Text(snapshot.data![index]['UserName']),
                          trailing: IconButton(onPressed: () {
                                db.getDelete(snapshot.data![index]['id']).then((value)
                                {
                                      setState(() {

                                      });
                                });
                          }, icon: Icon(Icons.delete)),);
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
              });
            }
          else
            {
              return Text('vikas');
            }
        },),
      ),
    );
  }
}
