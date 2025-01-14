import 'package:flutter/material.dart';
import 'package:note/CreateNote.dart';
import 'package:provider/provider.dart';
import 'ListMapProvider.dart';

class Note extends StatelessWidget {
  Note({super.key});

  void onPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateNote(),
      ),
    );
  }

  void showUpdateDialog(BuildContext context, int index) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    titleController.text = Provider.of<ListMapProvider>(context,listen: false).getdata()[index]["title"] ?? '';
    descriptionController.text = Provider.of<ListMapProvider>(context,listen: false).getdata()[index]["description"] ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Provider.of<ListMapProvider>(context,listen: false).updateData(index, titleController.text, descriptionController.text);
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Note',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      body: Consumer<ListMapProvider>(
        builder: (context, value, _) {
          var data = value.getdata();
          return (data.isNotEmpty)
              ? ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('${data[index]["title"]}'),
                    subtitle: Text('${data[index]["description"]}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(10)
                            ),
                             // Optional: Add padding
                            child: const Icon(
                              Icons.edit,
                              color: Colors.black, // Set icon color
                            ),
                          ),
                          onPressed: (){
                            showUpdateDialog(context, index);

                          },
                        ),
                        IconButton(
                          icon: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            // Optional: Add padding
                            child: Icon(
                              Icons.delete,
                              color: Colors.black, // Set icon color
                            ),
                          ),
                          onPressed: () {
                            value.removedata(index);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
              : const Center(
            child: Text(
              "Empty Note",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onPress(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
