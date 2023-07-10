import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo/models/todo.dart';


class HomeViewModel extends ChangeNotifier {
  List<Todo> todos = [];
  
  //! Todo listele
  
  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todos);
  UnmodifiableListView<Todo> get completedTodos => UnmodifiableListView(todos.where((todo) => todo.completed));
  UnmodifiableListView<Todo> get unCompletedTodos => UnmodifiableListView(todos.where((todo) => !todo.completed));

  //! Todo ekle
  void addTodo (Todo todo){
    todos.add(todo);
    notifyListeners();
  }
   
   //! Todo sil
   void removeTodo(Todo todo){
    //* todo indexi bul
    int todoindex = todos.indexOf(todo);

    //* todo sil
    todos.remove(todoindex);
    notifyListeners();
   }

   
}