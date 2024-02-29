import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seup_pro/Firestore/AddnewPost.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final fireStore = FirebaseFirestore.instance.collection("users").snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  final editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MYHomepage"),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: StreamBuilder(
            stream: fireStore,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){//update code
                        ref.doc(snapshot.data!.docs[index]["id"].toString()).update({
                          'title': 'Hello it is updated'
                        });
                            //delete code
                        ref.doc(snapshot.data!.docs[index]["id"].toString()).delete();
                      },


                      title: Text(snapshot.data!.docs[index]["title"].toString()),
                      subtitle: Text(snapshot.data!.docs[index]["id"].toString()),
                    );
                  },
                ),
              );
            }
    ),
        ),
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddNewPostFireStore()),
          );
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
