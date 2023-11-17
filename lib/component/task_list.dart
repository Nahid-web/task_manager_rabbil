import 'package:flutter/material.dart';
import 'package:task_manager_rabbil/style/style.dart';

ListView taskList(taskItems) {
  return ListView.builder(
    itemCount: taskItems.length,
    itemBuilder: (context, index) {
      return Card(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  taskItems[index]["title"],
                  style: head6Text(colorDarkBlue),
                ),
                Text(
                  taskItems[index]['description'],
                  style: head7Text(colorLightGray),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
