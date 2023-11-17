import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/component/task_list.dart';

import '../api/api_client.dart';
class CancelTask extends StatefulWidget {
  const CancelTask({super.key});

  @override
  State<CancelTask> createState() => _CancelTaskState();
}

class _CancelTaskState extends State<CancelTask> {
  List taskItems = [];
  bool isLoading = true ;

  callData() async {
    taskItems = await taskListRequest( "Cancel", context);
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
    return isLoading ? const Center(child: CircularProgressIndicator())
    :RefreshIndicator(
      onRefresh: () async{
        await callData();
      },
      child: taskList(taskItems),
    );
  }
}
