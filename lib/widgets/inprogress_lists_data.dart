import 'package:flutter/material.dart';
import 'package:grad_project/widgets/inprogress_lists.dart';

class InprogressListsData extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {
      "category": "Productivity Mobile App",
      "title": "Create Detail Booking",
      "time": "2 min ago",
      "progress": 60.0,
    },
    {
      "category": "Banking Mobile App",
      "title": "Revision Home Page",
      "time": "5 min ago",
      "progress": 70.0,
    },
    {
      "category": "Online Course",
      "title": "Working On Landing Page",
      "time": "7 min ago",
      "progress": 80.0,
    },
  ];
  InprogressListsData({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return InprogressLists(
              category: task['category'],
              title: task['title'],
              time: task['time'],
              progress: task['progress'],
            );
          }),
    );
  }
}
