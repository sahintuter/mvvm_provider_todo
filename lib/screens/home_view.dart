import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo/models/home_view_model.dart';
import 'package:mvvm_provider_todo/models/todo.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  final title = Text('MVVM TODO App');

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: title,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Görevler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.priority_high),
            label: 'Öncelikli',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Görevler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Geçmiş',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          buildTodoListTab(),
          buildPriorityTab(),
          buildTasksTab(),
          buildHistoryTab(),
        ],
      ),
    );
  }

  Widget buildTodoListTab() {
    return Consumer<HomeViewModel>(
      builder: (context, state, child) {
        return ListView.builder(
          itemCount: state.allTodos.length,
          itemBuilder: (context, index) {
            Todo todo = state.allTodos[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description ?? ''),
            );
          },
        );
      },
    );
  }

  Widget buildPriorityTab() {
    return Container(
      child: Center(
        child: Text('Öncelikli Görevler'),
      ),
    );
  }

  Widget buildTasksTab() {
    return Container(
      child: Center(
        child: Text('Görevler'),
      ),
    );
  }

  Widget buildHistoryTab() {
    return Container(
      child: Center(
        child: Text('Geçmiş'),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    Widget addButton = ElevatedButton(
      onPressed: () {},
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
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
              TextFormField(
                controller: descController,
              )
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
