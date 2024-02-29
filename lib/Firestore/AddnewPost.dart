import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class AddNewPostFireStore extends StatefulWidget {
  const AddNewPostFireStore({super.key});
  @override
  State<AddNewPostFireStore> createState() => _AddNewPostFireStoreState();
}
class _AddNewPostFireStoreState extends State<AddNewPostFireStore> {
  final postController = TextEditingController();
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),

            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: const InputDecoration(
                  hintText: 'What is in your mind?',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                fireStore.doc(id).set({
                  'title': postController.text.toString(),
                  'id': id,
                }).then((value){
                }).onError((error, stackTrace){
                        Text("error");
                });
                },
              child: const Text("Button"),
            )
        ],
        ),
      ),
    );
  }
}

