import 'package:api/model/model_post.dart';
import 'package:api/services/http_service.dart';
import 'package:flutter/material.dart';

class ScreenAllPost extends StatefulWidget {

  @override
  _ScreenAllPostState createState() => _ScreenAllPostState();
}

class _ScreenAllPostState extends State<ScreenAllPost> {
  late Future<List<ModelPost>> future_builder;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future_builder = HttpService.GetAllPost();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          toolbarHeight: 80.0,
          elevation: 10.0,
          title: Text('API Testing',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: EdgeInsets.lerp(EdgeInsets.all(20), EdgeInsets.all(10.0), 0.5),
          child:  FutureBuilder(
            future: future_builder,
            builder: (context,AsyncSnapshot<List<ModelPost>> snapshot) {
              if(snapshot.hasError){
                return Container(
                  child: Center(
                    child: Text('Error Occured'),
                  ),
                );
              } else if(snapshot.hasData){
                if(snapshot.data!.length > 0){
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index) {
                        return Container(
                          child: Text
                            (snapshot.data![index].title),);
                      }
                  );
                }
              } else (){
              };
              return Container();
            },
          ),
        )
    );
  }
}
