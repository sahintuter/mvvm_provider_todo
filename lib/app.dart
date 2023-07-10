import 'package:flutter/material.dart';
import 'package:mvvm_provider_todo/models/home_view_model.dart';
import 'package:mvvm_provider_todo/screens/home_view.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider<HomeViewModel>(create: (context)=> HomeViewModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'To-Do App',
      home:  HomeView(),
    ),
    );
  }
}