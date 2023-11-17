import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/component/task_list.dart';

import '../api/api_client.dart';

class ProgressTask extends StatefulWidget {
  const ProgressTask({super.key});

  @override
  State<ProgressTask> createState() => _ProgressTaskState();
}

class _ProgressTaskState extends State<ProgressTask> {
  List taskItems = [];
  bool isLoading = true;

  callData() async {
    taskItems = await taskListRequest("Progress", context);
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
