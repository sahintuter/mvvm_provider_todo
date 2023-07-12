import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/home_view_model.dart';
import '../models/todo.dart';


class AlertUtils {

  final errorText= 'Lütfen Başık Girin';
    showAlertDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    Widget addButton = ElevatedButton(
      onPressed: () {
        Todo todo = Todo(titleController.text, descController.text, false);
        if (formKey.currentState!.validate()) {
          Provider.of<HomeViewModel>(context, listen: false).addTodo(todo);
        }
        titleController.text = '';
        descController.text = '';
        
      },
      child: Text('Add Todo'),
    );
    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('Cancel'),
    );
    AlertDialog alert = AlertDialog(
      title: Text('Add'),
      content: Form(
        key: formKey,
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return errorText;
                  }
                  return null;
                 
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        addButton,
        cancelButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}