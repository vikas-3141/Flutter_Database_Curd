import 'package:flutter/material.dart';
import 'Api_Exicuter.dart';
import 'Practice_Insert.dart';
import 'db/mydatabase.dart';

class Practice_Api_List extends StatefulWidget {
  @override
  State<Practice_Api_List> createState() => _Practice_Api_ListState();
}

class _Practice_Api_ListState extends State<Practice_Api_List> {

  Api_Executor api = Api_Executor();
  mydatabase db=mydatabase();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addToDb();
  }

  addToDb() async {
    var dbData = await db.getUser();
    var apiData = await api.getApi();

    for (var element in apiData) {
      bool f = false;
      for (var element1 in dbData) {
        if (element['id'] == element1['id']) {
          f = true;
          break; // No need to continue if we found a match
        }
      }
      if (!f) {
        await db.insert(UserName: element['UserName']);
      }
    }
    setState(() {
      // Update UI if necessary
    });
  }


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
                        return Practice_Insert(map: snapshot.data![index],);
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
