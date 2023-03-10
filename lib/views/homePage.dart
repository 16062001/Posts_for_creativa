import 'package:flutter/material.dart';
import 'package:project1_posts/models/posts.dart';
import 'package:project1_posts/services/remote_service.dart';
class HomePage extends StatefulWidget {
  const HomePage(
       {Key? key}) : super(key: key
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;
@override

void initState(){
  super.initState();
  getData();
}

getData() async{
posts = await RemoteService().getPosts();
if (posts != null){
  setState(() {
    isLoaded = true;
  });
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tweets "),)
      ,
      body: Container(

         constraints: BoxConstraints.expand(),
         decoration: const BoxDecoration(
           image: DecorationImage(
               image: AssetImage("assets/images/p1.png"),
           fit: BoxFit.cover
           ),

         ),

        child:
        Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context,index){

            return Container(
              padding: const EdgeInsets.all(20),
              child:
              Row(
                children: [
                  Container(
                    height:30,
                    width: 30,
                    child: Text("#${posts![index].id}")
                    // Icon(Icons.access_alarm ,color: Colors.purpleAccent ),
                  ),
                  SizedBox(width: 50,),

                  Expanded(
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posts![index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),

                        Text(posts![index].body ?? "",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,

                        ),
                        Divider(height: 10,color: Colors.brown,)

                      ],
                    ),
                  ),
                ],
              ),
            );

          }),

          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
