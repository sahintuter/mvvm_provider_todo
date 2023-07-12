import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo/screens/all_todo_list_page.dart';
import 'package:mvvm_provider_todo/screens/build_priority_tab.dart';
import 'package:mvvm_provider_todo/util/add_show_alert_dialog.dart';
import 'package:mvvm_provider_todo/util/bottom_navi_bar.dart';

import 'build_history_tab.dart';
import 'build_task_tab.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
 

AlertUtils alertUtils = AlertUtils();

CustomBottom customBottom = CustomBottom();
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
         alertUtils.showAlertDialog(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: title,
      ),
      bottomNavigationBar: customBottom.bottomNaviBar((index) {
        setState(() {
         customBottom.currentIndex = index;
        });
      },),
      body: IndexedStack(
        index: customBottom.currentIndex,
        children: [
          AllTodoList(),
          PriorityTab(),
          TaskTab(),
          HistoryTab(),
        ],
      ),
    );
  }





}
