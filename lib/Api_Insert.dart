import 'package:flutter/material.dart';
import 'package:train/Api_Create.dart';

class Api_Insert extends StatelessWidget {
  Map? map;
  Api_Insert({this.map})
  {
    UserNameController.text=map!=null?map!['UserName']:'';
  }

  TextEditingController UserNameController=TextEditingController();

  Api_Create api=Api_Create();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${map!=null?"edit":"add"}User"),
      ),
      body: Column(
        children: [
          TextFormField(controller: UserNameController),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            if(map==null)
              {
                final faculty={
                  'UserName':UserNameController.text
                };
                api.Insert(faculty).then((value) => Navigator.pop(context));
              }
            else
              {
                final Fact={
                  'UserName':UserNameController.text
                };
                api.Update(Fact ,map!['id']).then((value) => Navigator.pop(context));
              }
          }, child: Text("Submit"))
        ],
      ),
    );
  }
}
