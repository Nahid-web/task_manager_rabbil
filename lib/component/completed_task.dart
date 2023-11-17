import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/component/task_list.dart';

import '../api/api_client.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  List taskItems = [];
  bool isLoading = true;

  callData() async {
    taskItems = await taskListRequest("Completed", context);
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
            onRefresh: () async {
              await callData();
            },
            child: taskList(taskItems),
          );
  }
}
