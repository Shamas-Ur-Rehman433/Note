import 'package:flutter/material.dart';
import 'package:note/ListMapProvider.dart';
import 'package:provider/provider.dart';

class CreateNote extends StatelessWidget {
  CreateNote({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  onPress(BuildContext context) {
    String title = titleController.text.trim();
    String description = descriptionController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
     Provider.of<ListMapProvider>(context, listen: false).addData({
        "title" : title,
        "description": description,
      });
      titleController.clear();
      descriptionController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in both fields.')),
      );
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: [
          InkWell(
            onTap: () => onPress(context),
            child: Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(fontSize: 20,color: Colors.black,),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: TextStyle(fontSize: 20,color: Colors.black,),

                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}
