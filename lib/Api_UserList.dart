import 'package:flutter/material.dart';
import 'package:train/Api_Create.dart';
import 'package:train/Api_Insert.dart';
import 'package:train/UserList.dart';

class Api_UserList extends StatefulWidget {

  @override
  State<Api_UserList> createState() => _Api_UserListState();
}

class _Api_UserListState extends State<Api_UserList> {
  
  Api_Create api=Api_Create();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("api"),
      actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Api_Insert();
              },));
            }, icon: Icon(Icons.add))
        ],),
      body: FutureBuilder(future: api.getAll(), builder: (context, snapshot) {
        if(snapshot.hasData)
          {
                return ListView.builder(itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Api_Insert(map: snapshot.data![index],);
                           },)).then((value){
                             setState(() {

                             });
                          });
                        },
                        title: Text(snapshot.data![index]['UserName']),
                        trailing: IconButton(onPressed: () {
                          api.delete(snapshot.data![index]['id']).then((value) {
                            setState(() {

                            });
                          });
                        }, icon: Icon(Icons.delete))
                      ),
                  );
                },);
          }
        else
          {
            return CircularProgressIndicator();
          }
      },),
    );
  }
}
