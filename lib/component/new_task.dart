import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/api/api_client.dart';
import 'package:task_manager_rabbil/component/task_list.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  List taskItems = [];
  bool isLoading = true;

  callData() async {
    taskItems = await taskListRequest("New", context);
    setState(() {
      isLoading = false;
      print(taskItems);
    });

  }

  @override
  void initState() {
    callData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
      onRefresh: () async{
        await callData();
      },
          child: taskList(taskItems),
        );
  }
}
