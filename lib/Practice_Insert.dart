import 'package:flutter/material.dart';
import 'package:train/Api_Exicuter.dart';
import 'package:train/db/PracticeDatabase.dart';

class Practice_Insert extends StatelessWidget
{
  Map? map;

  Practice_Insert({this.map})
  {
    UserNameContoller.text=map!=null?map!['UserName']:'';
  }

  TextEditingController UserNameContoller=TextEditingController();
  Api_Executor db=Api_Executor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("${map != null ? "Edit" : "Add"} User"), // Fixed this line
            backgroundColor: Theme.of(context).primaryColor),
    body: Column(
      children: [
        TextFormField(controller: UserNameContoller,),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          if(map==null)
            {
              final mat={
                 'UserName':UserNameContoller.text
              };
                db.insert(mat).then((value){ Navigator.pop(context);});
            }
          else
            {
              final up={
                'UserName':UserNameContoller.text,
                'id': map!['id']
              };
              db.update(up).then((value){
                Navigator.pop(context);
              });
            }
        }, child: Text('Submit'))
      ],
    )
    );
  }

}