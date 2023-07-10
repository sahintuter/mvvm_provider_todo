import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/home_view_model.dart';
import '../models/todo.dart';

class AllTodoList extends StatelessWidget {
  const AllTodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<HomeViewModel>(builder: (context, state, child) {
            return ListView.builder(
                itemCount: state.allTodos.length,
                itemBuilder: (context, index) {
                  Todo todo = state.allTodos[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description ?? ''),
                  );
                });
          }),
        ),
      ],
    );
  }
}
