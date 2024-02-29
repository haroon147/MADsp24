// Main file
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seup_pro/Firebase_Crud/addpost.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final ref = FirebaseDatabase.instance.ref("Hello");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MYHomepage"),
      ),
      body:Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: FirebaseAnimatedList(
                defaultChild: Text("Loading"),
                query: ref,
                itemBuilder: (context, snapshot, index, animation){
                return ListTile(
                  title: Text(snapshot.child('title').value.toString()),
                  subtitle: Text(snapshot.child('id').value.toString()),
                );
                }
            ))
         ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddPostScreen()),);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
