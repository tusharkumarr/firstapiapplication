import 'package:flutter/material.dart';
import 'package:facerecgnition/models/post.dart';

import '../services/remote_serives.dart';

class MyHomePage extends StatefulWidget{

  const MyHomePage({Key? key}):super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();

    //fetch data from api
    getData();
  }

  getData() async{
    posts=await RemoteSerives().getPosts();
    if(posts!=null){
      setState(() {
        isLoaded=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Posts'),
     ),
     body: Visibility(
       visible: isLoaded,
       child: ListView.builder(
           itemCount: posts?.length,
           itemBuilder: (context,index){

         return Container(
           padding: const EdgeInsets.all(16),

           child: Row(
             children: [
               Container(
                 height: 50,
                 width: 50,
                 decoration:BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Colors.grey[300],
                 ),
               ),
               SizedBox(width: 16),
               
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       posts![index].title,
                       maxLines: 2,
                       style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                     Text(
                       posts![index].body?? '',
                       maxLines: 3,
                       style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                     
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
   );
  }

}
