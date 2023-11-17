import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/component/bottom_navigation_bar.dart';
import 'package:task_manager_rabbil/component/cancel_task.dart';
import 'package:task_manager_rabbil/component/completed_task.dart';
import 'package:task_manager_rabbil/component/new_task.dart';
import 'package:task_manager_rabbil/component/progress_task.dart';
import 'package:task_manager_rabbil/style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tapIndex = 0;

  onItemTap(index){
    setState(() {
      tapIndex = index;
    });
  }
  
  final widgetOption = const [
    NewTask(),
    CompletedTask(),
    CancelTask(),
    ProgressTask(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widgetOption.elementAt(tapIndex),
      bottomNavigationBar: bottomNavigationBar(tapIndex, onItemTap),
    );
  }
}
