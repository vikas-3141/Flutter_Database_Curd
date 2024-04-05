import 'package:flutter/material.dart';
import 'package:train/db/mydatabase.dart';

class UserUpdate extends StatelessWidget {

  TextEditingController UserNameContoller=TextEditingController();
  Map? map;
  UserUpdate({this.map})
  {
    UserNameContoller.text=map!=null?map!['UserName']:'';
  }

  mydatabase db=mydatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${map != null ? "Edit" : "Add"} Faculty Enter"), // Fixed this line
          backgroundColor: Theme.of(context).primaryColor),
      body: Column(
        children: [
          TextFormField(controller: UserNameContoller,),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()
          {
            if(map==null)
            {
              db.insert(UserName: UserNameContoller.text).
              then((value)
              {
                Navigator.pop(context);
              });
            }

            db.update(UserName: UserNameContoller.text,Id:map!['id'] ).then((value){
              Navigator.pop(context);
            });
          }, child: Text("Submit"))
        ],
      ),
    );
  }
}
